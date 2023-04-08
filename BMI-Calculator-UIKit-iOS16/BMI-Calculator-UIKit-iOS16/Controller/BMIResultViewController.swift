//
//  BMIResultViewController.swift
//  BMI-Calculator-UIKit-iOS16
//
//  Created by Amr Mohamad on 04/04/2023.
//

import UIKit

class BMIResultViewController: UIViewController {

    let uiBMIReslut = BMIResultScreenUI()
    
    var bmiResultValue: String?
    var bmiResultAdvice: String?
    var bmiResultColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        uiBMIReslut.resultNumberLabel.text = bmiResultValue!
        uiBMIReslut.adviseResultLabel.text = bmiResultAdvice!
        view.backgroundColor = bmiResultColor!
        
        configButton()
    }
    
    @objc func reCalculateButtonPressed(){
        dismiss(animated: true)
    }
    
    func configButton() -> Void {
        uiBMIReslut.reCalculateButton.addTarget(self,
                                                action: #selector(reCalculateButtonPressed),
                                                for: .touchUpInside)
    }
    
}

extension BMIResultViewController{
    func setUI () {
        view.addSubview(uiBMIReslut.background)
        view.addSubview(uiBMIReslut.reCalculateButton)
        view.addSubview(uiBMIReslut.resultNumberLabel)
        view.addSubview(uiBMIReslut.yourResultLabel)
        view.addSubview(uiBMIReslut.adviseResultLabel)
        
        let backgroundImage = [
            uiBMIReslut.background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiBMIReslut.background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiBMIReslut.background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            uiBMIReslut.background.topAnchor.constraint(equalTo: view.topAnchor)
        ]
        
        let reCalculateButton = [
            uiBMIReslut.reCalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            uiBMIReslut.reCalculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            uiBMIReslut.reCalculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            uiBMIReslut.reCalculateButton.heightAnchor.constraint(equalToConstant: 51)
        ]
        
        let resultNumberLabel = [
            uiBMIReslut.resultNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiBMIReslut.resultNumberLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        let yourResultLabel = [
            uiBMIReslut.yourResultLabel.leadingAnchor.constraint(equalTo: uiBMIReslut.resultNumberLabel.leadingAnchor),
            uiBMIReslut.yourResultLabel.trailingAnchor.constraint(equalTo: uiBMIReslut.resultNumberLabel.trailingAnchor),
            uiBMIReslut.yourResultLabel.bottomAnchor.constraint(equalTo: uiBMIReslut.resultNumberLabel.topAnchor, constant: -1)
            
        ]
        
        let adviseResultLabel = [
            uiBMIReslut.adviseResultLabel.leadingAnchor.constraint(equalTo: uiBMIReslut.resultNumberLabel.leadingAnchor),
            uiBMIReslut.adviseResultLabel.trailingAnchor.constraint(equalTo: uiBMIReslut.resultNumberLabel.trailingAnchor),
            uiBMIReslut.adviseResultLabel.topAnchor.constraint(equalTo: uiBMIReslut.resultNumberLabel.bottomAnchor, constant: 1)
        ]
        
        NSLayoutConstraint.activate(backgroundImage)
        NSLayoutConstraint.activate(reCalculateButton)
        NSLayoutConstraint.activate(resultNumberLabel)
        NSLayoutConstraint.activate(yourResultLabel)
        NSLayoutConstraint.activate(adviseResultLabel)
    }
}
