//
//  BMIengine.swift
//  BMI-Calculator-iOS16
//
//  Created by Amr Mohamad on 06/04/2023.
//

import UIKit

struct BMIengine {
    var BMIResult: BMI?
    
    mutating func calculateBMI (height: Float, weight: Float){
        let BMIvalue = weight/(height*height)
        
        if BMIvalue < 18.5 {
            BMIResult = BMI(bmiValue: BMIvalue, advice: "Eat more pies!", color: UIColor.systemTeal )
        } else if BMIvalue < 24.9 {
            BMIResult = BMI(bmiValue: BMIvalue, advice: "Fit as a fiddle!", color: UIColor.systemGreen )
        } else {
            BMIResult = BMI(bmiValue: BMIvalue, advice: "Eat less pies!", color: UIColor.systemPink )
        }
    }
    
    func getAdvice() -> String {
        return BMIResult?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return BMIResult?.color ?? UIColor.systemBlue
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", BMIResult?.bmiValue ?? 0.0)
    }
}
