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

        if signupPresenter == nil {
            
            let signupModelValidator = SignupFormModalValidator()
            let signupWebservice = SignupWebService(urlString: SignupConstants.signupURLString)
            
            signupPresenter = SignupPresenter(formModalValidator: signupModelValidator, webservice: signupWebservice, delegate: self)
        }
    }


}


extension SignupViewController: SignupViewDelegateProtocol {
    
    func successfullSignup() {
        
    }
    
    func errorHandler(error: SignupErrors) {
        
        let alert = UIAlertController(title: "Error", message: "Your request could not be processed at this time.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
