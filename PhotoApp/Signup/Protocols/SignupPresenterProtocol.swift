//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by David SG on 10/11/2020.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    
    init(formModalValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    func processUserSignup(forModel: SignupFormModel)
}
