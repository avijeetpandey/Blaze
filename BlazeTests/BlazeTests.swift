//
//  BlazeTests.swift
//  BlazeTests
//
//  Created by Avijeet on 27/04/24.
//

import XCTest
@testable import Blaze

final class BlazeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitWithBaseUrl() throws {
        Blaze.initialise(with: "https://cat-fact.herokuapp.com")
        let isBaseUrlEmpty = Blaze._baseURL?.isEmpty
        XCTAssert(isBaseUrlEmpty == false, "Base URL is empty after init")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
