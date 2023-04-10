//
//  BillScreenUI.swift
//  Tipsy-UIKit-iOS16
//
//  Created by Amr Mohamad on 09/04/2023.
//

import UIKit

class BillScreenUI {
    
    let enterBillValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter bill total"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        return label
    }()
    
    let billValueTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "e.g. 123.56"
        tf.textColor = .systemGreen
        tf.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        tf.textAlignment = .center
        tf.keyboardType = .decimalPad
        return tf
    }()
    
    let billTotalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tertiarySystemBackground
        return view
    }()
    
    let tipsValueView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "tipsy_color")
        return view
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.tertiarySystemBackground, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        button.layer.cornerRadius = 15
        return button
    }()
    
    let selectTipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select tip"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        return label
    }()
    
    let zeroPresentValueButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("0%", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.tintColor = .systemGreen
        button.isSelected = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        return button
    }()
    
    let tenPresentValueButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("10%", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.tintColor = .systemGreen
        button.isSelected = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        return button
    }()
    
    let twentyPresentValueButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("20%", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.tintColor = .systemGreen
        button.isSelected = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        return button
    }()
    
    let chooseSplitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose Split"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        return label
    }()
    
    let splitValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2"
        label.textAlignment = .center
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        return label
    }()
    
    let stepperOfSplitValue: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.maximumValue = Double(25)
        stepper.minimumValue = Double(2)
        stepper.stepValue = stepper.minimumValue
        stepper.stepValue = Double(1)
        stepper.autorepeat = true
        stepper.isContinuous = true
        return stepper
    }()
}
