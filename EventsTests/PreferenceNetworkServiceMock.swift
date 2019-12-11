//
//  PreferenceNetworkServiceMock.swift
//  EventsTests
//
//  Created by Владислав Усачёв on 11/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation
@testable import Events

final class PreferenceNetworkServiceMock: PreferenceNetworkServiceLogic {

	var loadCategoriesCompletion: CategoriesHandler!
	func loadCategories(completion: @escaping ((CategoriesHandler) -> Void)) {
		completion(loadCategoriesCompletion)
	}
}
