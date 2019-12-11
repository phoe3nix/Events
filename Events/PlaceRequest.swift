//
//  PlaceRequest.swift
//  Events
//
//  Created by Владислав Усачёв on 11/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

internal final class PlaceRequest: Request<Place> {

	override init() {
		super.init()
		api = API(version: .minor4, category: "place-categories", query: "?lang=ru")
	}
}
