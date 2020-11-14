//
//  TestingUITextFieldPropertiesTests.swift
//  PhotoAppTests
//
//  Created by David SG on 14/11/20.
//

import XCTest
@testable import PhotoApp

class TestingUITextFieldPropertiesTests: XCTestCase {

    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
    }

    func test_EmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        
        let emailTextField = try XCTUnwrap(sut.userEmailTextField, "emailTextField is not connected")
        
        XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress, "emailTextField is not content type email address")
    }

    func test_EmailTextField_WhenCreated_HasEmailKeyboardTypeSet() throws {
        
        let emailTextField = try XCTUnwrap(sut.userEmailTextField, "emailTextField is not connected")
        
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress, "emailTextField is not keyboard type email address")
        
    }

    func test_passwordTextField_WhenCreated_IsSecureTextEntryField() throws {
        
        let passwordTextField = try XCTUnwrap(sut.userPasswordNameTextField, "passwordTextField is not connected")
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry, "passwordTextField is not a Secure Text Field Entry Field")
    }

}
