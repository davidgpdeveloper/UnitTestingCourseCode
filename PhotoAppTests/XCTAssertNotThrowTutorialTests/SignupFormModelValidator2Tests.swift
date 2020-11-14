//
//  SignupFormModelValidator2Tests.swift
//  PhotoAppTests
//
//  Created by David SG on 14/11/20.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidator2Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_FirstNameValidation_WhenInvalidCharacterProvided_ThrowsAnError() {
        
        // Arrange
        let sut = SignupFormModelValidator2()
        
        // Act and Assert
        XCTAssertThrowsError(try sut.isFirstNameValid("Sergey*"), "The isFirstNameValid should have thrown an error if user's first name illigal characters") { (errorThrown) in
            
            XCTAssertEqual(errorThrown as? SignupError, SignupError.illigalCharactersFound)
        }
  
    }
    
    func test_FirstNameValidation_WhenInvalidCharacterProvided_ThrowsAnError_doCatchExample() {
        
        // Arrange
        let sut = SignupFormModelValidator2()
        
        // Act and Assert

        do {
            let _ = try sut.isFirstNameValid("Sergey*")
            XCTFail("The isFirstNameValid() was supposed to throw an error when illigal characters used in User's first name.")
        } catch SignupError.illigalCharactersFound {
            // Successfully passing
            return
        } catch {
            XCTFail("The isFirstNameValid() was supposed to throw the SignupError.illigalCharactersFound Error when illigal characters used. A different Error was thrown.")
            return
        }
  
    }
    

    
    func test_FisrtNameValidation_WhenValidCharactersProvided_ThrowsNoErrors() {
        
        // Arrange
        let sut = SignupFormModelValidator2()
        
        // Act and Assert
        XCTAssertNoThrow(try sut.isFirstNameValid("Sergey"), "The isFirstNameValid should not have thrown an error when there are no illigal charracters provided.")
        
    }
    
    
    
    func test_FisrtNameValidation_WhenValidCharactersProvided_ThrowsNoErrors_doCatchExample() {
        
        // Arrange
        let sut = SignupFormModelValidator2()
        
        // Act and Assert

        do {
            let _ = try sut.isFirstNameValid("Sergey")
        } catch {
            XCTFail("The isFirstNameValid() was not supposed to throw an Error when a valid First Name value was provided.")
        }
        
    }
    
    
    
}
