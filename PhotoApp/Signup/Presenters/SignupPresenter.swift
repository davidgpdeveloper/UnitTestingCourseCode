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
    private weak var delegate: SignupViewDelegateProtocol?
    
    init(formModalValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModalValidator = formModalValidator
        self.webservice = webservice
        self.delegate = delegate
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
        
        webservice.signup(withForm: resquestModel) { [weak self] (responseModel, error) in
        
            if let error = error {
                self?.delegate?.errorHandler(error: error)
            } else if let _ = responseModel {
                self?.delegate?.successfullSignup()
                return
            }
        }
        
    }
    
}
