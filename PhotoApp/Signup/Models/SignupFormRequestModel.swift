//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by David SG on 08/11/2020.
//

import Foundation


struct SignupFormRequestModel: Encodable {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
}
