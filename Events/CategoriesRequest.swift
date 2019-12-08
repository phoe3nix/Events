//
//  CategoriesRequest.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

internal final class CategoriesRequest: Request<Categories> {

	override init() {
		super.init()
		api = API(version: .minor4, category: "event-categories", query: "?lang=ru")
	}
}
