//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by David SG on 09/11/2020.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupErrors)
}
