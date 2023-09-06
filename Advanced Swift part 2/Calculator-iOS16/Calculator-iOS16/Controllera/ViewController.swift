//
//  ViewController.swift
//  Calculator Layout iOS16
//
//  Created by Amr Mohamad on 25/02/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var displayedValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert string of label to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.text = "0"
    }
    var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        //        displayLabel.text = "0"
        calculator.setNumber(displayedValue)
        if displayLabel.text! != "."{
            if let calMethod = sender.currentTitle {
                
                if let result = calculator.calFunctions(symbol: calMethod) {
                    displayedValue = result
                }
                //                switch calMethod {
                //                case "+/-":
                //                   displayedValue *= -1
                //                case "AC":
                //                    displayLabel.text = "0"
                //                case "%":
                //                    displayedValue *= 0.01
                //                default:
                //                    displayLabel.text = "0"
                //                }
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
                        let isInt = floor(displayedValue) == displayedValue
                        if !isInt {return}
                    }
                } else {return}
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
