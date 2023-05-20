//
//  ViewController.swift
//  FlashChat-UIKit-iOS16
//
//  Created by Amr Mohamad on 08/05/2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let ui = WelcomeUI()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        
        let titleText = Constants.appName
        ui.titleLabel.text = ""
        var charIndex = 0.0
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.22 * charIndex, repeats: false) { (timer) in
                self.ui.titleLabel.text?.append(letter)
            }
            charIndex += 1.0
        }
        
        config()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc func registerButtonPressed(_ sender:UIButton){
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc func loginButtonPressed(_ sender:UIButton){
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }

}

// MARK: - Configrations

extension WelcomeViewController {
    func config(){
        ui.registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        ui.loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
}

// MARK: - UI Constraints
extension WelcomeViewController {
    func setUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(ui.titleLabel)
        
        let titleLabelConstraints = [
            ui.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ui.titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ui.titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                   constant: 52),
            ui.titleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                    constant: 0),
            ui.titleLabel.heightAnchor.constraint(equalToConstant: 52)
        ]
        
        let buttonsStack = UIStackView(
            arrangedSubviews: [
                ui.registerButton,
                ui.loginButton
            ]
        )
        view.addSubview(buttonsStack)
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.axis         = .vertical
        buttonsStack.alignment    = .fill
        buttonsStack.distribution = .fill
        buttonsStack.spacing      = 8
        let buttonsStackConstraints = [
            buttonsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonsStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        let buttonsConstraints = [
            ui.registerButton.heightAnchor.constraint(equalToConstant: 61),
            ui.loginButton.heightAnchor.constraint(equalToConstant: 61)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(buttonsStackConstraints)
        NSLayoutConstraint.activate(buttonsConstraints)
    }
}
