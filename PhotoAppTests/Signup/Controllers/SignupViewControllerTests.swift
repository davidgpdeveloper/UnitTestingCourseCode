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

    
    func test_SignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {

        let firstNameTextField = try XCTUnwrap(sut.userFirstNameTextField, "The firstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.userLastNameTextField, "The userLastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.userEmailTextField, "The userEmailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.userPasswordNameTextField, "The userPasswordNameTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.userRepeatPasswordNameTextField, "The userRepeatPasswordNameTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(firstNameTextField.text, "", "FirstName text field was not empty when the view controller initially loaded")
        XCTAssertEqual(lastNameTextField.text, "", "LastName text field was not empty when the view controller initially loaded")
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(repeatPasswordTextField.text, "", "RepeatPassword text field was not empty when the view controller initially loaded")
    }

    
    func test_SignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        
        // Arrange
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup button does not have a referencing outlet")
        
        // Act
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
    }
}
