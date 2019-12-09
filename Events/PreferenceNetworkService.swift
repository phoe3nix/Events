//
//  PreferenceNetworkService.swift
//  Events
//
//  Created by Владислав Усачёв on 09/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

typealias CategoriesHandler = Result<[Categories], EventsError>

internal protocol PreferenceNetworkServiceLogic: AnyObject {

	func loadCategories(completion: @escaping ((CategoriesHandler) -> Void))
}

internal final class PreferenceNetworkService: PreferenceNetworkServiceLogic {

	func loadCategories(completion: @escaping ((CategoriesHandler) -> Void)) {
		CategoriesRequest().perform { result in
			completion(result)
		}
	}
}
