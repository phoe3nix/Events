//
//  PreferenceNetworkService.swift
//  Events
//
//  Created by Владислав Усачёв on 09/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

typealias CategoriesHandler = Result<[Categories], EventsError>

/// Протокол, описывающий логику работы сервиса по работе с сетью сцены выбора категорий
internal protocol PreferenceNetworkServiceLogic: AnyObject {

	/// Загрузка категорий из сети
	///
	/// - Parameter completion: блок обработки результата
	func loadCategories(completion: @escaping ((CategoriesHandler) -> Void))
}

/// Сервис по работе с сетью сцены выбора категорий
internal final class PreferenceNetworkService: PreferenceNetworkServiceLogic {

	func loadCategories(completion: @escaping ((CategoriesHandler) -> Void)) {
		CategoriesRequest().perform { result in
			completion(result)
		}
	}
}
