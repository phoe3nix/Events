//
//  Assembly.swift
//  Events
//
//  Created by Владислав Усачёв on 04/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation
import Swinject

internal struct Assembly {

	static func createContainer() -> Container {
		let container = Container()

		container.register(PreferenceViewController.self) { resolver in
			let presenter = resolver.resolve(PreferencePresenter.self)!
			let viewController = PreferenceViewController()
			viewController.presenter = presenter
			presenter.viewLogic = viewController
			return viewController
		}

		container.register(PreferenceInteractor.self) { resolver in
			let networkService = resolver.resolve(PreferenceNetworkService.self)!
			return PreferenceInteractor(networkService: networkService)
		}

		container.register(PreferenceDataSource.self) { _ in PreferenceDataSource() }
		container.register(PreferenceNetworkService.self) { _ in PreferenceNetworkService() }

		container.register(PreferencePresenter.self) { resolver in
			let interactor = resolver.resolve(PreferenceInteractor.self)!
			let dataSource = resolver.resolve(PreferenceDataSource.self)!
			return PreferencePresenter(interactor: interactor, dataSource: dataSource)
		}

		return container
	}

	static func createTabBar() -> Container {
		let container = Container()

		container.register(FirstViewController.self) { _ in FirstViewController() }
		container.register(SecondViewController.self) { _ in SecondViewController() }
		container.register(ThirdViewController.self) { _ in ThirdViewController() }
		container.register(FourthViewController.self) { _ in FourthViewController() }
		container.register(FifthViewController.self) { _ in FifthViewController() }

		container.register(EventsTabBarController.self) { resolver in
			let first = resolver.resolve(FirstViewController.self)!
			let second = resolver.resolve(SecondViewController.self)!
			let third = resolver.resolve(ThirdViewController.self)!
			let fourth = resolver.resolve(FourthViewController.self)!
			let fifth = resolver.resolve(FifthViewController.self)!
			let tabBar = EventsTabBarController()
			tabBar.viewControllers = [first, second, third, fourth, fifth]
			tabBar.createTabBarItems()
			return tabBar
		}

		return container
	}
}
