//
//  TestingNavigationFilesVC.swift
//  PhotoApp
//
//  Created by David SG on 14/11/20.
//

import UIKit

class TestingNavigationFilesVC: UIViewController {
    
    @IBOutlet weak var buttonNextView: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonNextViewAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC {
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }


}
