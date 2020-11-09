//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by David SG on 09/11/2020.
//

import Foundation

class SignupPresenter {
    
    private var formModalValidator: SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    
    init(formModalValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol) {
        self.formModalValidator = formModalValidator
        self.webservice = webservice
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
        
        let resquestModel = SignupFormRequestModel(firstName: forModel.name, lastName: forModel.surname, email: forModel.email, password: forModel.password)
        
        webservice.signup(withForm: resquestModel) { (responseModel, error) in
        
            
        }
        
    }
    
}
