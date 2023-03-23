//
//  QuizUI.swift
//  Quizzler-MultipleChoice-iOS16
//
//  Created by Amr Mohamad on 22/03/2023.
//

import UIKit

class QuizUI {
    
    let scoreLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.text = "Score: "
        label.numberOfLines = 1
        return label
    }()
    
    let questionTextLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.text = "Question Text"
        label.numberOfLines = 0
        return label
    }()
    
    
    let choose1Button : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Choose 1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        button.layer.borderWidth = CGFloat(5)
        button.layer.cornerRadius = CGFloat(25)
        button.layer.borderColor = UIColor.systemGray2.cgColor
        return button
    }()
    
    let choose2Button : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Choose 2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        button.layer.borderWidth = CGFloat(5)
        button.layer.cornerRadius = CGFloat(25)
        button.layer.borderColor = UIColor.systemGray2.cgColor
        return button
    }()
    
    let choose3Button : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Choose 3", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
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
    
    let progressBar: UIProgressView = {
        let bar = UIProgressView()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.progressViewStyle = .bar
        bar.progress = 0.0
        bar.contentMode = .scaleToFill
        bar.progressTintColor = UIColor(named: "progressBarColor")
        bar.trackTintColor = .white
        return bar
    }()

}
