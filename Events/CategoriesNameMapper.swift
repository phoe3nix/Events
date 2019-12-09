//
//  CategoriesNameMapper.swift
//  Events
//
//  Created by Владислав Усачёв on 09/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

// swiftlint:disable all
internal struct CategoriesNameMapper {

	static func nameMapper(category: Categories) -> Categories {
		switch category.id {
		case 13:
			category.name = "Благие дела"
			return category
		case 20:
			category.name = "Маскарад"
			return category
		case 23:
			category.name = "Творчество"
			return category
		case 26:
			category.name = "Распродажа"
			return category
		case 31:
			category.name = "Презентации"
			return category
		case 32:
			category.name = "Фокусы"
			return category
		case 34:
			category.name = "Comedy club"
			return category
		case 37:
			category.name = "Цирк"
			return category
		case 38:
			category.name = "Абитуриент"
			return category
		case 40:
			category.name = "Фото"
			return category
		case 44:
			category.name = "Выставки"
			return category
		case 45:
			category.name = "Бизнес"
			return category
		case 47:
			category.name = "Развлечения"
			return category
		default:
			return category
		}
	}
}
