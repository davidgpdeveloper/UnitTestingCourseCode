//
//  LoadingViewControllerInUnitTests.swift
//  PhotoAppTests
//
//  Created by David SG on 10/11/2020.
//

import XCTest
@testable import PhotoApp

class LoadingViewControllerInUnitTests: XCTestCase {

    var sut: LoadingVC!
    var sut2: XIBBasedViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "LoadingVC") as? LoadingVC
        sut.loadViewIfNeeded()
        
        // XIB
        sut2 = XIBBasedViewController()
        sut2.loadViewIfNeeded()
        
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
