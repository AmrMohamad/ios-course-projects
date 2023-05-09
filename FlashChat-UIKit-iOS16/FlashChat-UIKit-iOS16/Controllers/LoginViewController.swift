//
//  LoginViewController.swift
//  FlashChat-UIKit-iOS16
//
//  Created by Amr Mohamad on 09/05/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let ui = LoginUI()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
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
