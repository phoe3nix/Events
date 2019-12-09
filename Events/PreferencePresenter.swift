//
//  PreferencePresenter.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

internal protocol PreferencePresenterLogic: AnyObject {

	var interactor: PreferenceInteractorLogic { get }

	var dataSource: PreferenceDataSource { get }

	func viewDidLoad()
}

internal final class PreferencePresenter: PreferencePresenterLogic {

	let interactor: PreferenceInteractorLogic

	let dataSource: PreferenceDataSource

	weak var viewLogic: PreferenceViewControllerLogic?

	init(interactor: PreferenceInteractorLogic, dataSource: PreferenceDataSource) {
		self.interactor = interactor
		self.dataSource = dataSource
	}

	func viewDidLoad() {
		interactor.loadDataFromNetworkService { [weak self] result in
			guard let self = self, let viewLogic = self.viewLogic else { return }
			switch result {
			case .success(let categories):
				print(categories)
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
