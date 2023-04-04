//
//  ViewController.swift
//  BMI-Calculator-UIKit-iOS16
//
//  Created by Amr Mohamad on 28/03/2023.
//

import UIKit

class BMIMainViewController: UIViewController {
    let uiBMI = BMIMainScreenUI()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(uiBMI.background)
        view.addSubview(uiBMI.calculateButton)
        view.addSubview(uiBMI.weightSlider)
        view.addSubview(uiBMI.heightSlider)
        view.addSubview(uiBMI.weightLabel)
        view.addSubview(uiBMI.weightNumberLabel)
        view.addSubview(uiBMI.heightLabel)
        view.addSubview(uiBMI.heightNumberLabel)
        view.addSubview(uiBMI.calculateYourBMILabel)
        
        
        setUI()
        configButton()
    }
    
    @objc func viewScreen (){
        let resultScreen = BMIResultViewController()
        
        resultScreen.modalPresentationStyle = .pageSheet
        resultScreen.sheetPresentationController?.prefersGrabberVisible = true
        present(resultScreen, animated: true)
    }
    
    func configButton (){
        uiBMI.calculateButton.addTarget(self, action: #selector(viewScreen), for: .touchUpInside)
    }

}

extension BMIMainViewController{
    func setUI() {
        let background = [
            uiBMI.background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiBMI.background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiBMI.background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            uiBMI.background.topAnchor.constraint(equalTo: view.topAnchor)
        ]
        let calculateButton = [
            uiBMI.calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            uiBMI.calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            uiBMI.calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            uiBMI.calculateButton.heightAnchor.constraint(equalToConstant: 51)
        ]
        
        let weightSlider = [
            uiBMI.weightSlider.leadingAnchor.constraint(equalTo: uiBMI.calculateButton.leadingAnchor),
            uiBMI.weightSlider.trailingAnchor.constraint(equalTo: uiBMI.calculateButton.trailingAnchor),
            uiBMI.weightSlider.bottomAnchor.constraint(equalTo: uiBMI.calculateButton.topAnchor, constant: -10),
            uiBMI.weightSlider.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let weightLabel = [
            uiBMI.weightLabel.leadingAnchor.constraint(equalTo: uiBMI.weightSlider.leadingAnchor),
            uiBMI.weightLabel.bottomAnchor.constraint(equalTo: uiBMI.weightSlider.topAnchor, constant: -10),
            uiBMI.weightLabel.heightAnchor.constraint(equalToConstant: 21)
        ]
        
        let weightNumberLabel = [
            uiBMI.weightNumberLabel.trailingAnchor.constraint(equalTo: uiBMI.weightSlider.trailingAnchor),
            uiBMI.weightNumberLabel.centerYAnchor.constraint(equalTo: uiBMI.weightLabel.centerYAnchor),
            uiBMI.weightNumberLabel.heightAnchor.constraint(equalToConstant: 21)
        ]
        
        let heightSlider = [
            uiBMI.heightSlider.leadingAnchor.constraint(equalTo: uiBMI.calculateButton.leadingAnchor),
            uiBMI.heightSlider.trailingAnchor.constraint(equalTo: uiBMI.calculateButton.trailingAnchor),
            uiBMI.heightSlider.bottomAnchor.constraint(equalTo: uiBMI.weightLabel.topAnchor, constant: -10),
            uiBMI.heightSlider.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let heightLabel = [
            uiBMI.heightLabel.leadingAnchor.constraint(equalTo: uiBMI.heightSlider.leadingAnchor),
            uiBMI.heightLabel.bottomAnchor.constraint(equalTo: uiBMI.heightSlider.topAnchor, constant: -10),
            uiBMI.heightLabel.heightAnchor.constraint(equalToConstant: 21)
        ]
        
        let heightNumberLabel = [
            uiBMI.heightNumberLabel.trailingAnchor.constraint(equalTo: uiBMI.heightSlider.trailingAnchor),
            uiBMI.heightNumberLabel.centerYAnchor.constraint(equalTo: uiBMI.heightLabel.centerYAnchor),
            uiBMI.heightNumberLabel.heightAnchor.constraint(equalToConstant: 21)
        ]
        
        let calculateYourBMILabel = [
            uiBMI.calculateYourBMILabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            uiBMI.calculateYourBMILabel.bottomAnchor.constraint(equalTo: uiBMI.heightLabel.topAnchor, constant: -10),
            uiBMI.calculateYourBMILabel.trailingAnchor.constraint(equalTo: uiBMI.calculateButton.trailingAnchor),
            uiBMI.calculateYourBMILabel.leadingAnchor.constraint(equalTo: uiBMI.calculateButton.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(background)
        NSLayoutConstraint.activate(calculateButton)
        NSLayoutConstraint.activate(weightSlider)
        NSLayoutConstraint.activate(weightLabel)
        NSLayoutConstraint.activate(weightNumberLabel)
        NSLayoutConstraint.activate(heightSlider)
        NSLayoutConstraint.activate(heightLabel)
        NSLayoutConstraint.activate(heightNumberLabel)
        NSLayoutConstraint.activate(calculateYourBMILabel)
    }
}

