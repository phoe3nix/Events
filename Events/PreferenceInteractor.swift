//
//  PreferenceInteractor.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

internal protocol PreferenceInteractorLogic: AnyObject {

	var networkService: PreferenceNetworkServiceLogic { get }

	func loadDataFromNetworkService(completion: @escaping ((CategoriesHandler) -> Void))
}

internal final class PreferenceInteractor: PreferenceInteractorLogic {

	let networkService: PreferenceNetworkServiceLogic

	init(networkService: PreferenceNetworkServiceLogic) {
		self.networkService = networkService
	}

	func loadDataFromNetworkService(completion: @escaping ((CategoriesHandler) -> Void)) {
		networkService.loadCategories { result in
			completion(result)
		}
	}
}
