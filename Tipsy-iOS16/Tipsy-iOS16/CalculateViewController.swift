//
//  ViewController.swift
//  Tipsy-iOS16
//
//  Created by Amr Mohamad on 08/04/2023.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitValueLabel: UILabel!
    @IBOutlet weak var numberOfPersonsStepper: UIStepper!
    
    var tipValue     : Double = 0.0
    var splitNumber  : Double = 2.0
    var billPerPerson: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        zeroPcButton.isSelected   = false
        tenPcButton.isSelected    = false
        twentyPcButton.isSelected = false
        
    }
    
    
    @IBAction func tipSelected(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPcButton.isSelected   = false
        tenPcButton.isSelected    = false
        twentyPcButton.isSelected = false
        
        let selectedButton = true
        switch sender.currentTitle!{
        case "0%":
            zeroPcButton.isSelected = selectedButton
            tipValue = 0.0
        case "10%":
            tenPcButton.isSelected = selectedButton
            tipValue = 0.1
        case "20%":
            twentyPcButton.isSelected = selectedButton
            tipValue = 0.2
        default:
            print("wrong select")
        }
    }
    
    
    @IBAction func stepperValueChaged(_ sender: UIStepper) {
        splitValueLabel.text = "\(Int(sender.value))"
        splitNumber = sender.value
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            billPerPerson = ((Double(bill)! * tipValue) + Double(bill)!)/splitNumber
            self.performSegue(withIdentifier: "sendResult", sender: self)
            print(String(format: "%.2f", billPerPerson))
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendResult"{
            let resultVC = segue.destination as! ResultViewController
            resultVC.sentTotalValue = String(format: "%.2f", billPerPerson)
        }
    }
}


