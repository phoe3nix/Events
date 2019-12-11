//
//  EventsTabBarController.swift
//  Events
//
//  Created by Владислав Усачёв on 11/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import UIKit

internal final class EventsTabBarController: UITabBarController {

	func createTabBarItems() {
		firstItem()
		secondItem()
		thirdItem()
		fourthItem()
		fifthItem()
	}

	private func firstItem() {
		guard let firstViewController = viewControllers?.first else { return }
		let tabBarItem = UITabBarItem(title: "Первый", image: nil, tag: 0)
		firstViewController.tabBarItem = tabBarItem
	}

	private func secondItem() {
		guard let secondViewController = viewControllers?[1] else { return }
		let tabBarItem = UITabBarItem(title: "Второй", image: nil, tag: 1)
		secondViewController.tabBarItem = tabBarItem
	}

	private func thirdItem() {
		guard let thirdViewController = viewControllers?[2] else { return }
		let tabBarItem = UITabBarItem(title: "Третий", image: nil, tag: 2)
		thirdViewController.tabBarItem = tabBarItem
	}

	private func fourthItem() {
		guard let fourthViewController = viewControllers?[3] else { return }
		let tabBarItem = UITabBarItem(title: "Четвертый", image: nil, tag: 3)
		fourthViewController.tabBarItem = tabBarItem
	}

	private func fifthItem() {
		guard let fifthViewController = viewControllers?[4] else { return }
		let tabBarItem = UITabBarItem(title: "Пятый", image: nil, tag: 4)
		fifthViewController.tabBarItem = tabBarItem
	}
}
