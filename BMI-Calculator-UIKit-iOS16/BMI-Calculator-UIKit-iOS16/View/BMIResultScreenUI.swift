//
//  BMIResultScreenUI.swift
//  BMI-Calculator-UIKit-iOS16
//
//  Created by Amr Mohamad on 04/04/2023.
//

import Foundation
import UIKit

class BMIResultScreenUI {
    
    let background:UIImageView = {
        let image = UIImageView(image: UIImage(named: "result_background"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let reCalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RECALCULATE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.setTitleColor(UIColor(named: "reCalculateButtonText"), for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    let resultNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19.5"
        label.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let yourResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "YOUR RESULT"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let adviseResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "EAT SOME MORE SNACKS!"
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
}
