//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by David SG on 09/11/2020.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_SignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        
        // Arrange
        let signupFormModel = SignupFormModel(name: "Sergey",
                                              surname: "Kargopolov",
                                              email: "test@test.com",
                                              password: "12345678",
                                              repeatPassword: "12345678")
        
        let mockSignupModalValidator = MockSignupModalValidator()
        
        let sut = SignupPresenter(formModalValidator: mockSignupModalValidator)
        
        // Act
        sut.processUserSignup(forModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModalValidator.isFirstNameValidated, "Fisrt name was not validated")
        XCTAssertTrue(mockSignupModalValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModalValidator.isPasswordEqualityValidated, "Did not validate if passwords match")
    }
    
    func test_SignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        
        // Arrange
        let signupFormModel = SignupFormModel(name: "Sergey",
                                              surname: "Kargopolov",
                                              email: "test@test.com",
                                              password: "12345678",
                                              repeatPassword: "12345678")
        
        let mockSignupModalValidator = MockSignupModalValidator()
        let mockSignupWebService = mockSignupWebService()
        
        // Act
        let sut = SignupPresenter(formModalValidator: mockSignupModalValidator)
        sut.processUserSignup(forModel: signupFormModel)
        
        // Assert
        
    }

}
