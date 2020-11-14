//
//  SignupFormModelValidator2.swift
//  PhotoApp
//
//  Created by David SG on 14/11/20.
//

import Foundation


class SignupFormModelValidator2 {
    
    private let invalidCharacters = CharacterSet(charactersIn: "{}#*&^.,/?!@")
    
    func isFirstNameValid(_ firstName: String) throws -> Bool {
        
        var returnValue = true
        
        if (firstName.rangeOfCharacter(from: invalidCharacters) != nil) {
            throw SignupError.illigalCharactersFound
        }
        
        if firstName.count < 2 || firstName.count > 10 {
            returnValue = false
        }
        
        return returnValue
    }
}
