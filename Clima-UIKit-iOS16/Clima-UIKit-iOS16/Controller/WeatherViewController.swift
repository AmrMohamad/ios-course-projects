//
//  ViewController.swift
//  Clima-UIKit-iOS16
//
//  Created by Amr Mohamad on 23/04/2023.
//

import UIKit

class WeatherViewController: UIViewController {

    let wthrUI = WeatherUI()
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }


}





extension WeatherViewController {
    func setUI(){
        view.addSubview(wthrUI.bGImage)
        view.addSubview(wthrUI.locationButton)
        view.addSubview(wthrUI.searchButton)
        view.addSubview(wthrUI.searchTextField)
        view.addSubview(wthrUI.conditionImage)
        view.addSubview(wthrUI.dgreeSignLabel)
        view.addSubview(wthrUI.dgreeValueLabel)
        view.addSubview(wthrUI.cityLabel)
        
        
        let bGImageConstrains = [
            wthrUI.bGImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wthrUI.bGImage.topAnchor.constraint(equalTo: view.topAnchor),
            wthrUI.bGImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wthrUI.bGImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let locationButtonConstrains = [
            wthrUI.locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            wthrUI.locationButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            wthrUI.locationButton.heightAnchor.constraint(equalToConstant: 40),
            wthrUI.locationButton.widthAnchor.constraint(equalToConstant: 40)
        ]
        
        let searchButtonConstrains = [
            wthrUI.searchButton.centerYAnchor.constraint(equalTo: wthrUI.locationButton.centerYAnchor),
            wthrUI.searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            wthrUI.searchButton.heightAnchor.constraint(equalToConstant: 40),
            wthrUI.searchButton.widthAnchor.constraint(equalToConstant: 40)
        ]
        
        let searchTextFieldConstrains = [
            wthrUI.searchTextField.centerYAnchor.constraint(equalTo: wthrUI.locationButton.centerYAnchor),
            wthrUI.searchTextField.leadingAnchor.constraint(equalTo: wthrUI.locationButton.trailingAnchor, constant: 10),
            wthrUI.searchTextField.trailingAnchor.constraint(equalTo: wthrUI.searchButton.leadingAnchor, constant: -10)
        ]
        
        let conditionImageConstrains = [
            wthrUI.conditionImage.trailingAnchor.constraint(equalTo: wthrUI.searchButton.trailingAnchor),
            wthrUI.conditionImage.topAnchor.constraint(equalTo: wthrUI.searchButton.bottomAnchor, constant: 10),
            wthrUI.conditionImage.heightAnchor.constraint(equalToConstant: 120),
            wthrUI.conditionImage.widthAnchor.constraint(equalToConstant: 120)
            
        ]
        
        let dgreeSignLabelConstrains = [
            wthrUI.dgreeSignLabel.trailingAnchor.constraint(equalTo: wthrUI.searchButton.trailingAnchor),
            wthrUI.dgreeSignLabel.topAnchor.constraint(equalTo: wthrUI.conditionImage.bottomAnchor, constant: 10)
        ]
        
        let dgreeValueLabelConstrains = [
            wthrUI.dgreeValueLabel.centerYAnchor.constraint(equalTo: wthrUI.dgreeSignLabel.centerYAnchor),
            wthrUI.dgreeValueLabel.trailingAnchor.constraint(equalTo: wthrUI.dgreeSignLabel.leadingAnchor, constant: 0)
        ]
        
        let cityLabelConstrains = [
            wthrUI.cityLabel.trailingAnchor.constraint(equalTo: wthrUI.searchButton.trailingAnchor),
            wthrUI.cityLabel.topAnchor.constraint(equalTo: wthrUI.dgreeSignLabel.bottomAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(bGImageConstrains)
        NSLayoutConstraint.activate(locationButtonConstrains)
        NSLayoutConstraint.activate(searchButtonConstrains)
        NSLayoutConstraint.activate(searchTextFieldConstrains)
        NSLayoutConstraint.activate(conditionImageConstrains)
        NSLayoutConstraint.activate(dgreeSignLabelConstrains)
        NSLayoutConstraint.activate(dgreeValueLabelConstrains)
        NSLayoutConstraint.activate(cityLabelConstrains)
    }
}
