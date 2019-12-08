//
//  API.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

internal enum APIVersion: String {
	case version1 = "v1"
	case minor1 = "v1.1"
	case minor2 = "v1.2"
	case minor3 = "v1.3"
	case minor4 = "v1.4"
}

internal class API {

	let version: APIVersion
	let category: String
	let query: String

	init(version: APIVersion, category: String, query: String) {
		self.version = version
		self.category = category
		self.query = query
	}
}
