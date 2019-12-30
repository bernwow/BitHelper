//
//  BitHelperTests.swift
//  BitHelperTests
//
//  Created by Берн on 30.12.2019.
//  Copyright © 2019 Bern. All rights reserved.
//

import XCTest
@testable import BitHelper

class BitHelperTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCurrencyModel() {
        let currencyListModel = CurrencyListModel()
        currencyListModel.startUpdating()
        XCTAssert(currencyListModel.timer != nil)
        XCTAssert(currencyListModel.timer?.isValid ?? false)

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
