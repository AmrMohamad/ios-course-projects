//
//  QuizUI.swift
//  Quizzler-MultipleChoice-iOS16
//
//  Created by Amr Mohamad on 22/03/2023.
//

import UIKit

class QuizUI {
    let choose1Button : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Test", for: .normal)
        button.layer.borderWidth = CGFloat(5)
        button.layer.cornerRadius = CGFloat(25)
        button.layer.borderColor = UIColor.systemGray2.cgColor
        return button
    }()
    
    let choose2Button : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Test", for: .normal)
        button.layer.borderWidth = CGFloat(5)
        button.layer.cornerRadius = CGFloat(25)
        button.layer.borderColor = UIColor.systemGray2.cgColor
        return button
    }()
    
    let choose3Button : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Test", for: .normal)
        button.layer.borderWidth = CGFloat(5)
        button.layer.cornerRadius = CGFloat(25)
        button.layer.borderColor = UIColor.systemGray2.cgColor
        return button
    }()
    
    let imageBG : UIImageView = {
        let image = UIImageView(image: UIImage(named: "Background-Bubbles")!)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()

}
