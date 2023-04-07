//
//  BMIengine.swift
//  BMI-Calculator-iOS16
//
//  Created by Amr Mohamad on 06/04/2023.
//

import Foundation

struct BMIengine {
    var BMIvalue: Float?
    
    mutating func calculateBMI (height: Float, weight: Float){
        BMIvalue = weight/(height*height)
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", BMIvalue ?? 0.0)
    }
}
