//
//  CalculatorLogic.swift
//  Calculator-iOS16
//
//  Created by Amr Mohamad on 04/09/2023.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    private var firstPartOfCalculation: (n1: Double, calMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calFunctions(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC" :
                return 0
            case "%"  :
                return n * 0.01
            case "="  :
                return performTwoNumCalculation(n2: n)
            default:
                firstPartOfCalculation = (n1: n, calMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
            
            if let n1 = firstPartOfCalculation?.n1,
                let operation = firstPartOfCalculation?.calMethod {
                
                switch operation {
                case "+":
                    return n1 + n2
                case "-":
                    return n1 - n2
                case "×":
                    return n1 * n2
                case "÷":
                    return n1 / n2
                default:
                    fatalError("The operation passed in does not match any of the cases.")
                }
            }
            return nil
        }
}
