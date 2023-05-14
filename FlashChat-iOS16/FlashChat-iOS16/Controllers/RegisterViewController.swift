//
//  RegisterViewController.swift
//  FlashChat-iOS16
//
//  Created by Amr Mohamad on 09/05/2023.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.roundedTextFieldWithShadow()
        passwordTextField.roundedTextFieldWithShadow()
        
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let singup = Auth.auth()
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            singup.createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print("===>\(e.localizedDescription)")
                } else {
                    self.performSegue(withIdentifier: Constants.registerToChat, sender: self)
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
