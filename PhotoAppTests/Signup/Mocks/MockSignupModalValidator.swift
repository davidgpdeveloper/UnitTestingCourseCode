//
//  MockSignupModalValidator.swift
//  PhotoAppTests
//
//  Created by David SG on 09/11/2020.
//

import Foundation
@testable import PhotoApp

class MockSignupModalValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isPasswordEqualityValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }
    
}
