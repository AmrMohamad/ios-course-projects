//
//  ViewController.swift
//  Calculator Layout iOS16
//
//  Created by Amr Mohamad on 25/02/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishedTypingNumber: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.text = "0"
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        //        displayLabel.text = "0"
        if displayLabel.text! != "."{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert string of label to a Double")
            }
            if let calMethod = sender.currentTitle {
                switch calMethod {
                case "+/-":
                    displayLabel.text = number == 0.0 ? "0" : String(number * -1)
                case "AC":
                    displayLabel.text = "0"
                case "%":
                    displayLabel.text = number == 0.0 ? "0" : String(number * 0.01)
                default:
                    displayLabel.text = "0"
                }
            }
        } else {return}
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if displayLabel.text! != "."{
                    if numValue == "." {
                        guard let currentDisplayValue = Double(displayLabel.text!) else {
                            fatalError("Cannot convert string of label to a Double")
                        }
                        let isInt = floor(currentDisplayValue) == currentDisplayValue
                        if !isInt {return}
                    }
                } else {return}
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
