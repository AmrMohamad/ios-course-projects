//
//  ViewController.swift
//  Destini-iOS16
//
//  Created by Amr Mohamad on 24/03/2023.
//

import UIKit

class MainDestiniViewController: UIViewController {

    let destiniUI = DestiniUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(destiniUI.background)
        view.addSubview(destiniUI.storyLabel)
        setUI()
    }

    

}

extension MainDestiniViewController {
    
    func setUI(){
        
        let imageBGConstraints = [
            destiniUI.background.topAnchor.constraint(equalTo: view.topAnchor),
            destiniUI.background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            destiniUI.background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            destiniUI.background.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ]
        
        let storyLabelConstraints = [
            destiniUI.storyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            destiniUI.storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            destiniUI.storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(imageBGConstraints)
        NSLayoutConstraint.activate(storyLabelConstraints)
    }
    
}
