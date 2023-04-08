//
//  ResultViewController.swift
//  BMI-Calculator-iOS16
//
//  Created by Amr Mohamad on 06/04/2023.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiResultValue: String?
    var bmiResultAdvice: String?
    var bmiResultColor: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = bmiResultValue!
        adviceLabel.text = bmiResultAdvice!
        view.backgroundColor = bmiResultColor!
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
