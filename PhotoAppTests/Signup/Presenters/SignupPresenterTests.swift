//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by David SG on 09/11/2020.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {

    var signupFormModel: SignupFormModel!
    var mockSignupModalValidator: MockSignupModalValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        signupFormModel = SignupFormModel(name: "Sergey",
                                              surname: "Kargopolov",
                                              email: "test@test.com",
                                              password: "12345678",
                                              repeatPassword: "12345678")
        
        mockSignupModalValidator = MockSignupModalValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        
        sut = SignupPresenter(formModalValidator: mockSignupModalValidator, webservice: mockSignupWebService, delegate: mockSignupViewDelegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupFormModel = nil
        mockSignupModalValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil
    }

    
    func test_SignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        
        // Arrange
        
        // Act
        sut.processUserSignup(forModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModalValidator.isFirstNameValidated, "Fisrt name was not validated")
        XCTAssertTrue(mockSignupModalValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModalValidator.isPasswordEqualityValidated, "Did not validate if passwords match")
    }
    
    func test_SignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        
        // Arrange
        
        // Act
        let sut = SignupPresenter(formModalValidator: mockSignupModalValidator, webservice: mockSignupWebService, delegate: mockSignupViewDelegate)
        sut.processUserSignup(forModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }
    
    func test_SignupPresenter_WhenSignupSuccessful_CallsSuccessOnViewDelegate() {
        
        // Arrange
        let myExpectation = expectation(description: "Expected the susccessfulSignup() method to be called")
        
        mockSignupViewDelegate.expectation = myExpectation
        
        // Act
        sut.processUserSignup(forModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfullSignupCounter, 1, "The successfullSignup() method was called more than one time")
    }

}
