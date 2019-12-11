//
//  PreferencePresenter.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

/// Протокол, описывающий логику работы презентера экрана выбора категорий
internal protocol PreferencePresenterLogic: AnyObject {

	/// ссылка на интерактор
	var interactor: PreferenceInteractorLogic { get }

	/// ссылка на dataSource
	var dataSource: PreferenceDataSource { get }

	/// обратная ссылка на view
	var viewLogic: PreferenceViewControllerLogic? { get }

	/// Метод, вызываемый, по загрузке основного view
	func viewDidLoad()
}

/// Презентер сцены выбора категорий
internal final class PreferencePresenter: PreferencePresenterLogic {

	let interactor: PreferenceInteractorLogic

	let dataSource: PreferenceDataSource

	weak var viewLogic: PreferenceViewControllerLogic?

	/// Основной инициализатор класса
	///
	/// - Parameters:
	///   - interactor: ссылка на интерактор
	///   - dataSource: ссылка на dataSource
	init(interactor: PreferenceInteractorLogic, dataSource: PreferenceDataSource) {
		self.interactor = interactor
		self.dataSource = dataSource
	}

	func viewDidLoad() {
		interactor.loadDataFromNetworkService { [weak self] result in
			guard let self = self, let viewLogic = self.viewLogic else { return }
			switch result {
			case .success(let categories):
				self.dataSource.categories = categories.map { CategoriesNameMapper.nameMapper(category: $0) }
				DispatchQueue.main.async {
					viewLogic.updateCollectionView()
				}
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
}
