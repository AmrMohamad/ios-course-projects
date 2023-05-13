//
//  LoginViewController.swift
//  FlashChat-UIKit-iOS16
//
//  Created by Amr Mohamad on 09/05/2023.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let ui = LoginUI()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
        config()
    }
    
    @objc func loginButtonPressed (_ sender:UIButton) {
        if let email = ui.emailTextField.text,
           let password = ui.passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print("===>\(e.localizedDescription)")
                } else {
                    self.navigationController?.pushViewController(ChatViewController(), animated: true)
                }
            }
        }
    }
}

extension LoginViewController {
    func config () {
        ui.loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
}

extension LoginViewController {
    func setUI(){
        view.backgroundColor = UIColor(named: "BrandBlue")
        
        let textFieldsStack = UIStackView(
            arrangedSubviews: [
                ui.emailTextField,
                ui.passwordTextField
            ]
        )
        textFieldsStack.translatesAutoresizingMaskIntoConstraints = false
        textFieldsStack.axis         = .vertical
        textFieldsStack.alignment    = .fill
        textFieldsStack.distribution = .fill
        textFieldsStack.spacing      = 25
        
        let regStack = UIStackView(
            arrangedSubviews: [
                textFieldsStack,
                ui.loginButton
            ]
        )
        
        regStack.translatesAutoresizingMaskIntoConstraints = false
        regStack.axis         = .vertical
        regStack.alignment    = .fill
        regStack.distribution = .fill
        regStack.spacing      = 35
        
        view.addSubview(regStack)
        
        let regStackConstraints = [
            regStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            regStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            regStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35)
        ]
        
        let textFieldsHeightConstraints = [
            ui.emailTextField.heightAnchor.constraint(equalToConstant: 60),
            ui.passwordTextField.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(regStackConstraints)
        NSLayoutConstraint.activate(textFieldsHeightConstraints)
        
    }
}
