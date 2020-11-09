//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by David SG on 09/11/2020.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false

    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void) {
        
        isSignupMethodCalled = true
        
        let responseModel = SignupResponseModel(status: "Ok")
        
        completionHandler(responseModel, nil)
    }

}
