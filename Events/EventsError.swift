//
//  EventsError.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation

internal enum EventsError: Error {
	case dataResponse
	case serialize(String)
	case `guard`
}
