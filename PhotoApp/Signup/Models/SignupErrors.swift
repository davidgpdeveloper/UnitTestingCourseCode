//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by David SG on 08/11/2020.
//

import Foundation

enum SignupErrors: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    case invalidFirstName
    case invalidFamilyName
    case invalidEmail
    
    var errorDescription: String? {
        switch self {
        case .invalidResponseModel, .invalidRequestURLString, .invalidFirstName, .invalidFamilyName, .invalidEmail:
            return ""
        case .failedRequest(description: let description):
            return description
        }
    }
}


enum SignupError: Error {
    case illigalCharactersFound
}
