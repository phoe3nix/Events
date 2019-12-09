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
}

internal final class PreferencePresenter: PreferencePresenterLogic {

	let interactor: PreferenceInteractorLogic

	let dataSource: PreferenceDataSource

	init(interactor: PreferenceInteractorLogic, dataSource: PreferenceDataSource) {
		self.interactor = interactor
		self.dataSource = dataSource
	}
}
