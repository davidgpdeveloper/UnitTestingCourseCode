//
//  SignupFormModalValidator.swift
//  PhotoApp
//
//  Created by David SG on 06/11/2020.
//

import Foundation
import UIKit


class SignupFormModalValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }

    
}
