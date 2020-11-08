//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by David SG on 08/11/2020.
//

import Foundation

class SignupWebService {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignupErrors.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if let requestError = error {
                completionHandler(nil, SignupErrors.failedRequest(description: requestError.localizedDescription))
            } else if let data = data, let signResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signResponseModel, nil)
            } else {
                completionHandler(nil, SignupErrors.invalidResponseModel)
            }
            
        }
        
        dataTask.resume()
    }
    
}
