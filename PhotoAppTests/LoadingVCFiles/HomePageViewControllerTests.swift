//
//  HomePageViewControllerTests.swift
//  PhotoAppTests
//
//  Created by David SG on 10/11/2020.
//

import XCTest
@testable import PhotoApp

class HomePageViewControllerTests: XCTestCase {

    var sut: HomePageViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = HomePageViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
