//
//  Request.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

internal class Request<T: Decodable> {

	var api: API?

	func perform(completion: @escaping ((Result<[T], EventsError>) -> Void)) {
		guard let urlRequest = createUrlRequest() else {
			completion(.failure(.guard))
			return
		}
		URLSession.shared.dataTask(with: urlRequest) { (data: Data?, _, error: Error?) in
			guard let data = data else {
				completion(.failure(.dataResponse))
				return
			}
			do {
				let result = try JSONDecoder().decode([T].self, from: data)
				completion(.success(result))
			} catch {
				completion(.failure(.serialize(error.localizedDescription)))
			}
		}.resume()
	}

	private func createUrlRequest() -> URLRequest? {
		guard let api = api,
			let url = URL(string: "https://kudago.com/public-api/\(api.version.rawValue)/\(api.category)/\(api.query)")
			else { return nil }
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = "GET"
		urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
		return urlRequest
	}

}
