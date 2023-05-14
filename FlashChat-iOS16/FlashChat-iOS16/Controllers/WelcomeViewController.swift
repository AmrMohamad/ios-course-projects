//
//  ViewController.swift
//  FlashChat-iOS16
//
//  Created by Amr Mohamad on 08/05/2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let titleText = Constants.appName
        titleLabel.text = ""
        var charIndex = 0.0
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.15 * charIndex,
                                 repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1.0
        }
    }


}

