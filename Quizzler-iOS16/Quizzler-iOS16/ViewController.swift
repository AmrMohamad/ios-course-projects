//
//  ViewController.swift
//  Quizzler-iOS16
//
//  Created by Amr Mohamad on 13/03/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        trueButton.layer.borderWidth = CGFloat(5)
        trueButton.layer.cornerRadius = CGFloat(25)
        trueButton.layer.borderColor = UIColor.systemGray2.cgColor
        
        falseButton.layer.borderWidth = CGFloat(5)
        falseButton.layer.cornerRadius = CGFloat(25)
        falseButton.layer.borderColor = UIColor.systemGray2.cgColor
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
    }
}

