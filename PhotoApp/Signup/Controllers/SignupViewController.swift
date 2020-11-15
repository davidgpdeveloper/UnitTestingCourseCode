//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by David SG on 10/11/2020.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordNameTextField: UITextField!
    @IBOutlet weak var userRepeatPasswordNameTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        let signupFormModel = SignupFormModel(name: userFirstNameTextField.text ?? "",
                                              surname: userLastNameTextField.text ?? "",
                                              email: userEmailTextField.text ?? "",
                                              password: userPasswordNameTextField.text ?? "",
                                              repeatPassword: userRepeatPasswordNameTextField.text ?? "")
        
        signupPresenter?.processUserSignup(forModel: signupFormModel)
    }
    
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        #if DEBUG
//        if CommandLine.arguments.contains("-skipSurvey") {
//            print("Skipping survey page")
//        }
//        #endif
//
//        #if DEBUG
//        if ProcessInfo.processInfo.arguments.contains("-skipSurvey") {
//            print("Skipping survey page")
//        }
//        #endif
        
        

        if signupPresenter == nil {
            
            let signupModelValidator = SignupFormModalValidator()
            
            let signupUrl = ProcessInfo.processInfo.environment["signupUrl"] ?? SignupConstants.signupURLString
            
            let signupWebservice = SignupWebService(urlString: signupUrl)
            
            signupPresenter = SignupPresenter(formModalValidator: signupModelValidator, webservice: signupWebservice, delegate: self)
        }
    }


}


extension SignupViewController: SignupViewDelegateProtocol {
    
    func successfullSignup() {
        
        createAlertDialog(title: "Success",
                          message: "The signup operation was successful",
                          accessibilityIdentifier: "successAlertDialog")
        
    }
    
    func errorHandler(error: SignupErrors) {
        
        createAlertDialog(title: "Error",
                          message: "Your request could not be processed at this time.",
                          accessibilityIdentifier: "errorAlertDialog")
    }
    
    private func createAlertDialog(title: String, message: String, accessibilityIdentifier: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = accessibilityIdentifier
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}
