//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by David SG on 09/11/2020.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void)
    
}
