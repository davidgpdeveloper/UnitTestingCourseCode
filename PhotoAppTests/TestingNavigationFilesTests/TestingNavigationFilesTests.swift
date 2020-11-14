//
//  TestingNavigationFilesTests.swift
//  PhotoAppTests
//
//  Created by David SG on 14/11/20.
//

import XCTest
@testable import PhotoApp

class TestingNavigationFilesTests: XCTestCase {

    var sut: TestingNavigationFilesVC!
    var navigationController: UINavigationController!
    
    override func setUpWithError() throws {
        
        // Step 1. Create an instance of UIStoryboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Step 2. Instantiate UIViewController with Storyboard ID
        if let viewController = storyboard.instantiateViewController(withIdentifier: "TestingNavigationFilesVC") as? TestingNavigationFilesVC {
            
            self.sut = viewController
            
            // Step 3. Make the viewDidLoad execute.
            self.sut.loadViewIfNeeded()
            
            navigationController = UINavigationController(rootViewController: sut)
        }
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
    }


    func test_NextViewButton_WhenTapped_SecondVCIsPushed() {
        
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is SecondVC
        }
        
        expectation(for: myPredicate, evaluatedWith: navigationController)
        
        sut.buttonNextView.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 1.5)
    }
    
    func test_NextViewButton_WhenTapped_SecondVCIsPushed_V2() {
        
        sut.buttonNextView.sendActions(for: .touchUpInside)
        
        RunLoop.current.run(until: Date())
        
        guard let _ = navigationController.topViewController as? SecondVC else {
            XCTFail()
            return
        }
    }
    
    func test_NextViewButton_WhenTapped_SecondVCIsPushed_V3() {
        
        let spyNavigationController = SpyNavigationController(rootViewController: sut)
        
        sut.buttonNextView.sendActions(for: .touchUpInside)
        
        guard let _ = spyNavigationController.pushedViewController as? SecondVC else {
            XCTFail()
            return
        }
    }

}
