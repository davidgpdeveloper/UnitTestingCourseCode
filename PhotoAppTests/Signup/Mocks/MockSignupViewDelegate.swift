//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by David SG on 09/11/2020.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {

    var expectation: XCTestExpectation?
    var successfullSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError: SignupErrors?
    
    func successfullSignup() {
        successfullSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupErrors) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }

}
