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
        
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(buttonsStackConstraints)
    }
}
