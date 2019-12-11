//
//  PreferenceInteractor.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

/// Протокол, описывающий логику работы интерактора сцены выбора категорий
internal protocol PreferenceInteractorLogic: AnyObject {

	/// сервис по работе с сетью
	var networkService: PreferenceNetworkServiceLogic { get }

	/// Загрузка данных из сети
	///
	/// - Parameter completion: блок обработки результата
	func loadDataFromNetworkService(completion: @escaping ((CategoriesHandler) -> Void))
}

/// Интерактор сцены выбора категорий
internal final class PreferenceInteractor: PreferenceInteractorLogic {

	let networkService: PreferenceNetworkServiceLogic

	/// Основной инициализатор класса
	///
	/// - Parameter networkService: сервис по работе с сетью
	init(networkService: PreferenceNetworkServiceLogic) {
		self.networkService = networkService
	}

	func loadDataFromNetworkService(completion: @escaping ((CategoriesHandler) -> Void)) {
		networkService.loadCategories { result in
			completion(result)
		}
	}
}
