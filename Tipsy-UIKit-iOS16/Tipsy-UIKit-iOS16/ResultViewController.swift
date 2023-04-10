//
//  ResultViewController.swift
//  Tipsy-UIKit-iOS16
//
//  Created by Amr Mohamad on 10/04/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    let resultUI = ResultScreenUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
        configUI()
    }

    @objc func recalculateButtonPressed(){
        dismiss(animated: true)
    }
}

extension ResultViewController {
    func configUI(){
        resultUI.recalculateButton.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
    }
    
    func setUI (){
        view.backgroundColor = .tertiarySystemBackground
        
        view.addSubview(resultUI.resultValueView)
        view.addSubview(resultUI.totalPerPersonLabel)
        view.addSubview(resultUI.totalPerPersonValueLabel)
        view.addSubview(resultUI.descriptionSettingsLabel)
        view.addSubview(resultUI.recalculateButton)
        
        let resultValueViewConstraints = [
            resultUI.resultValueView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultUI.resultValueView.topAnchor.constraint(equalTo: view.topAnchor),
            resultUI.resultValueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultUI.resultValueView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let totalPerPersonLabelConstraints = [
            resultUI.totalPerPersonLabel.centerYAnchor.constraint(equalTo: resultUI.resultValueView.centerYAnchor),
            resultUI.totalPerPersonLabel.leadingAnchor.constraint(equalTo: resultUI.resultValueView.leadingAnchor),
            resultUI.totalPerPersonLabel.trailingAnchor.constraint(equalTo: resultUI.resultValueView.trailingAnchor),
            resultUI.totalPerPersonLabel.heightAnchor.constraint(equalToConstant: 36)
            
        ]
        
        let totalPerPersonValueLabelConstraints = [
            resultUI.totalPerPersonValueLabel.centerXAnchor.constraint(equalTo: resultUI.totalPerPersonLabel.centerXAnchor),
            resultUI.totalPerPersonValueLabel.leadingAnchor.constraint(equalTo: resultUI.resultValueView.leadingAnchor),
            resultUI.totalPerPersonValueLabel.trailingAnchor.constraint(equalTo: resultUI.resultValueView.trailingAnchor),
            resultUI.totalPerPersonValueLabel.topAnchor.constraint(equalTo: resultUI.totalPerPersonLabel.bottomAnchor),
            resultUI.totalPerPersonValueLabel.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        let descriptionSettingsLabelConstraints = [
            resultUI.descriptionSettingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            resultUI.descriptionSettingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            resultUI.descriptionSettingsLabel.topAnchor.constraint(equalTo: resultUI.resultValueView.bottomAnchor),
            resultUI.descriptionSettingsLabel.heightAnchor.constraint(equalToConstant: 117)
        ]
        
        let recalculateButtonConstraints = [
            resultUI.recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            resultUI.recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultUI.recalculateButton.heightAnchor.constraint(equalToConstant: 54),
            resultUI.recalculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200)
        ]
        
        NSLayoutConstraint.activate(resultValueViewConstraints)
        NSLayoutConstraint.activate(totalPerPersonLabelConstraints)
        NSLayoutConstraint.activate(totalPerPersonValueLabelConstraints)
        NSLayoutConstraint.activate(descriptionSettingsLabelConstraints)
        NSLayoutConstraint.activate(recalculateButtonConstraints)
    }
}
