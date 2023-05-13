//
//  ChatUI.swift
//  FlashChat-UIKit-iOS16
//
//  Created by Amr Mohamad on 13/05/2023.
//

import UIKit

class ChatUI {
    let logoutButton : UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Log Out"
        button.style = .plain
        return button
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = UIColor(named: "BrandLightPurple")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return button
    }()
    
    let writingTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemBackground
        tf.placeholder = "Write a message..."
        tf.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        tf.textColor = UIColor(named: "BrandPurple")
        tf.roundedTextFieldWithShadow(cornerRadius: 10.0)
        return tf
    }()
}
