//
//  Place.swift
//  Events
//
//  Created by Владислав Усачёв on 11/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

internal final class Place: Decodable {
	let id: Int?
	var name: String?
	let slug: String
}

extension Place: Equatable {
	static func == (lhs: Place, rhs: Place) -> Bool {
		return lhs.id == rhs.id && lhs.name == rhs.name && lhs.slug == rhs.slug
	}
}
