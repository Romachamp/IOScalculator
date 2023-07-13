//
//  PercentCalculatorFunctions.swift
//  Calculator
//
//  Created by Роман on 07.06.2023.
//

import Foundation

class PercentCalculatorFunctions {
    func plus(num1: Float, num2: Float) -> Float {
        let percent = (num2 * num1) / 100
        return num1 + percent
    }
    
    func minus(num1: Float, num2: Float) -> Float {
        let percent = (num2 * num1) / 100
        return num1 - percent
    }
    
    func divide(num1: Float, num2: Float) -> Float {
        let percent = (num2 * num1) / 100
        return num1 / percent
    }
    
    func multiply(num1: Float, num2: Float) -> Float {
        let percent = (num2 * num1) / 100
        return num1 * percent
    }
    
    func getPercentOfNumber(num1: Float, num2: Float) -> Float {
        let percent = (num2 * num1) / 100
        return percent
    }
    
}
