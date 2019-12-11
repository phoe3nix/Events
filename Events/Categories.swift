//
//  Categories.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

internal final class Categories: Decodable {
	let id: Int?
	var name: String?
	let slug: String
}

extension Categories: Equatable {
	static func == (lhs: Categories, rhs: Categories) -> Bool {
		return lhs.id == rhs.id && lhs.name == rhs.name && lhs.slug == rhs.slug
	}
}
