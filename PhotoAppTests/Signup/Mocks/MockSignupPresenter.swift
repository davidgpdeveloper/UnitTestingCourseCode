//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by David SG on 10/11/2020.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled = false
    
    required init(formModalValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        
        
    }
    
    func processUserSignup(forModel: SignupFormModel) {
        processUserSignupCalled = true
    }
    
}
