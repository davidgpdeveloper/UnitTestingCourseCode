//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by David SG on 09/11/2020.
//

import Foundation

class SignupPresenter {
    
    private var formModalValidator: SignupModelValidatorProtocol
    
    init(formModalValidator: SignupModelValidatorProtocol) {
        self.formModalValidator = formModalValidator
    }
    
    func processUserSignup(forModel: SignupFormModel) {
        
        if !formModalValidator.isFirstNameValid(firstName: forModel.name) {
            return 
        }
        
        if !formModalValidator.isLastNameValid(lastName: forModel.surname) {
            return
        }
        
        if !formModalValidator.doPasswordMatch(password: forModel.email, repeatPassword: forModel.repeatPassword) {
            return
        }
    }
    
}
