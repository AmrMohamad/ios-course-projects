//
//  DestiniUI.swift
//  Destini-iOS16
//
//  Created by Amr Mohamad on 24/03/2023.
//

import Foundation
import UIKit

class DestiniUI {
    let background : UIImageView = {
        let image = UIImageView(image: UIImage(named: "backgroundImage"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let storyLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Story Text"
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    let choice1Button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = CGFloat(25)
        button.setTitle("Choice 1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        button.backgroundColor = UIColor(named: "Choice 1 Button")
        return button
    }()
    
    let choice2Button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = CGFloat(25)
        button.setTitle("Choice 2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        button.backgroundColor = UIColor(named: "Choice 2 Button")
        return button
    }()
    
}
