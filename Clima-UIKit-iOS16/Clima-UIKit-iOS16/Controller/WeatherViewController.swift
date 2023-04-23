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
        
        NSLayoutConstraint.activate(bGImageConstrains)
        NSLayoutConstraint.activate(locationButtonConstrains)
    }
}
