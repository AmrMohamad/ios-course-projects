//
//  BMIMainScreenUI.swift
//  BMI-Calculator-UIKit-iOS16
//
//  Created by Amr Mohamad on 29/03/2023.
//

import Foundation
import UIKit

class BMIMainScreenUI {
    let background:UIImageView = {
        let image = UIImageView(image: UIImage(named: "calculate_background"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CALCULATE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "backgroundColorCalculateButton")
        return button
    }()
    
    let weightSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = Float(0)
        slider.maximumValue = Float(200)
        slider.setValue(slider.maximumValue/2, animated: true)
        slider.minimumTrackTintColor = UIColor(named: "sliderColor")
        slider.thumbTintColor = UIColor(named: "sliderColor")
        return slider
    }()
    
    let heightSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = Float(0)
        slider.maximumValue = Float(3)
        slider.setValue(slider.maximumValue/2, animated: true)
        slider.minimumTrackTintColor = UIColor(named: "sliderColor")
        slider.thumbTintColor = UIColor(named: "sliderColor")
        return slider
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight"
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    let weightNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100Kg"
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height"
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    let heightNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1.5m"
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    let calculateYourBMILabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CALCULATE YOUR BMI"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .darkGray
        return label
    }()

}
