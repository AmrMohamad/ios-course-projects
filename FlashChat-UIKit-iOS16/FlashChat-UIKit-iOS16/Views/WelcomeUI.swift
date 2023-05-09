//
//  WelcomeUI.swift
//  FlashChat-UIKit-iOS16
//
//  Created by Amr Mohamad on 09/05/2023.
//

import UIKit

class WelcomeUI {
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "⚡️FlashChat"
        label.textColor = UIColor(named: "BrandBlue")
        label.font = UIFont.systemFont(ofSize: 50, weight: .black)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 25
        return label
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        button.setTitleColor(UIColor(named: "BrandBlue"), for: .normal)
        button.setTitleShadowColor(.black, for: .normal)
        button.backgroundColor = UIColor(named: "BrandLightBlue")
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        return button
    }()
}
