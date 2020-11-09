//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by David SG on 09/11/2020.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool
    
}
