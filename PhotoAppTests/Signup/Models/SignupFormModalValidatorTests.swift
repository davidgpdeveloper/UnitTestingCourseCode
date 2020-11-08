//
//  SignupFormModalValidatorTests.swift
//  PhotoAppTests
//
//  Created by David SG on 06/11/2020.
//

import XCTest
@testable import PhotoApp

class SignupFormModalValidatorTests: XCTestCase {

    var sut: SignupFormModalValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModalValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func test_SignupFormModalValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange / Given
//        let sut  = SignupFormModalValidator()
        
        // Act / When
        let firstNameValid = sut.isFirstNameValid(firstName: "David")
        
        // Assert / Then
        XCTAssertTrue(firstNameValid, "The firstNameValid returned FALSE")
    }
    
    func test_SignupFormModalValidator_WhenToShortFirstNameProvide_ShouldReturnFalse() {
        
        // Arrange
//        let sut = SignupFormModalValidator()
        
        // Act
        let isFirtNameValid = sut.isFirstNameValid(firstName: "S")
        
        // Assert
        XCTAssertFalse(isFirtNameValid, "The isFirstNameValid is shorter than \(SignupConstants.firstNameMinLength) characters")
    }
    
    func test_SignupFormModalValidator_WhenToLongFirstNameProvide_ShouldReturnFalse() {
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "DavidDavidDavid")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid is longer than \(SignupConstants.firstNameMaxLength) characters")
    }

    func test_SignupFormModalValidator_WhenPasswordProvided_ShouldReturnTrue() {
        
        // Act
        let doPasswordsMatch = sut.doPasswordMatch(password: "12345678", repeatPassword: "12345678")
        
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch returned FALSE")
    }
    
    func test_SignupFormModalValidator_WhenNotMatchingPasswordProvided_ShouldReturnFalse() {
        
        // Act
        let doPasswordsMatch = sut.doPasswordMatch(password: "1234", repeatPassword: "123")
        
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch returned TRUE")
    }
}
