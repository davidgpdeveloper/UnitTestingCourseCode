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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        signupFormModel = SignupFormModel(name: "Sergey",
                                              surname: "Kargopolov",
                                              email: "test@test.com",
                                              password: "12345678",
                                              repeatPassword: "12345678")
        
        mockSignupModalValidator = MockSignupModalValidator()
        mockSignupWebService = MockSignupWebService()
        
        sut = SignupPresenter(formModalValidator: mockSignupModalValidator, webservice: mockSignupWebService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupFormModel = nil
        mockSignupModalValidator = nil
        mockSignupWebService = nil
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
        let sut = SignupPresenter(formModalValidator: mockSignupModalValidator, webservice: mockSignupWebService)
        sut.processUserSignup(forModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }

}
