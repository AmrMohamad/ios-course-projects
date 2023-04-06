//
//  ViewController.swift
//  BMI-Calculator-iOS16
//
//  Created by Amr Mohamad on 29/03/2023.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue:Float = 0.0
    
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
       bmiValue =  weightSlider.value/(heightSlider.value * heightSlider.value)
        self.performSegue(withIdentifier: "goToResultScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultScreen" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiResultValue = String(format: "%.1f", bmiValue)
        }
    }
}

