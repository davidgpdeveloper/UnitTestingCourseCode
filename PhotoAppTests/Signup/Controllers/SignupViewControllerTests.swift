//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by David SG on 10/11/2020.
//

import XCTest
@testable import PhotoApp

class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    
    func test_SignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() {

        XCTAssertEqual(sut.userFirstNameTextField.text, "", "FirstName text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.userLastNameTextField.text, "", "LastName text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.userEmailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.userPasswordNameTextField.text, "", "Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut.userRepeatPasswordNameTextField.text, "", "RepeatPassword text field was not empty when the view controller initially loaded")
    }

}
