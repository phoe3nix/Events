//
//  PreferenceInteractorTests.swift
//  EventsTests
//
//  Created by Владислав Усачёв on 11/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import XCTest
@testable import Events

class PreferenceInteractorTests: XCTestCase {

	var interactor: PreferenceInteractor!
	var networkService: PreferenceNetworkServiceMock!

    override func setUp() {
        super.setUp()
		networkService = PreferenceNetworkServiceMock()
		interactor = PreferenceInteractor(networkService: networkService)
    }

    override func tearDown() {
		interactor = nil
		networkService = nil
        super.tearDown()
    }

	func testLoadDataFromNetworkServiceComplete() {
		//Arrange
		let categories = [Categories]()
		let expectedResultToBeReturned: CategoriesHandler = Result.success(categories)
		networkService.loadCategoriesCompletion = expectedResultToBeReturned
		let requestCompletionHandlerExpectation = expectation(description: "request expectation")

		//Act
		interactor.loadDataFromNetworkService(completion: { result in

			//Assert
			XCTAssertEqual(expectedResultToBeReturned, result)
			requestCompletionHandlerExpectation.fulfill()
		})

		waitForExpectations(timeout: 1, handler: nil)
	}
}
