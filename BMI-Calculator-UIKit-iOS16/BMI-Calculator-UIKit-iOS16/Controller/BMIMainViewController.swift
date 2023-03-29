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
        
        setUI()
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
        
        NSLayoutConstraint.activate(background)
    }
}

