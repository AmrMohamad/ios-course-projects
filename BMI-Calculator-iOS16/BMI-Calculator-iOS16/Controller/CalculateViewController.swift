//
//  ViewController.swift
//  BMI-Calculator-iOS16
//
//  Created by Amr Mohamad on 29/03/2023.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiEngine = BMIengine()
    
    @IBOutlet weak var heightNumberLabel: UILabel!
    @IBOutlet weak var weightNumberLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChaged(_ sender: UISlider) {
        heightNumberLabel.text = "\(String(format: "%.1f",sender.value))m"
    }
    
    @IBAction func weightSliderChaged(_ sender: UISlider) {
        weightNumberLabel.text = "\(Int(sender.value))Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        bmiEngine.calculateBMI(height: heightSlider.value,
                               weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResultScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultScreen" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiResultValue  = bmiEngine.getBMIValue()
            resultVC.bmiResultAdvice = bmiEngine.getAdvice()
            resultVC.bmiResultColor  = bmiEngine.getColor()
        }
    }
}

