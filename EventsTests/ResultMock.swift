//
//  ResultMock.swift
//  EventsTests
//
//  Created by Владислав Усачёв on 11/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import Foundation
@testable import Events

func == <T: Equatable, E: Equatable>(lhs: Result<T, E>, rhs: Result<T, E>) -> Bool {
	switch (lhs, rhs) {
	case let(.success(value1), .success(value2)):
		return value1 == value2
	case let(.failure(error1), .failure(error2)):
		return error1 == error2
	default:
		return false
	}
}
