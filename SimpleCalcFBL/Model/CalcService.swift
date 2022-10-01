//
//  CalcService.swift
//  SimpleCalcFBL
//
//  Created by Ильяс on 25.09.2022.
//

import Foundation

class CalcService {
    
    // MARK: - Propertise
    var isRinning = true
    var currentNumber = "0"
    var firstNumber = 0.0
    var secondNumber = 0.0
    var result = ""
    var currentOperation = Operations.noAction
    var displayView: ViewController
    
    init(displayView: ViewController) {
        self.displayView = displayView
    }
    
    
    // MARK: - Methods
    func numberActin(number: Int) {
        if currentNumber != "0" {
            currentNumber.append(String(number))
            displayView.updateDisplay(text: currentNumber)
        } else {
            currentNumber = String(number)
            displayView.updateDisplay(text: currentNumber)
        }
    }
    func makeCalculation(operation: Operations) {
        if currentOperation != .noAction {
            if currentNumber != "" {
                secondNumber = Double(currentNumber) ?? 0.0
                switch operation {
                case .addition:
                    result = String(firstNumber + secondNumber)
                case .substraction:
                    result = String(firstNumber - secondNumber)
                case .multiplication:
                    result = String(firstNumber * secondNumber)
                case .division:
                    result = String(firstNumber / secondNumber)
                default:
                    break
                }
                
                firstNumber = Double(result)!
                if Double(result)!.truncatingRemainder(dividingBy: 1) == 0 {
                    result = String(Int(Double(result)!))
                }
                currentNumber = result
                displayView.updateDisplay(text: currentNumber)
                currentOperation = .noAction
            }
        } else {
            firstNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
            displayView.updateDisplay(text: currentNumber)
            currentOperation = operation
        }
    }
    
    func addition() {
        makeCalculation(operation: .addition)
    }
    func substraction() {
        makeCalculation(operation: .substraction)
    }
    func multiplication() {
        makeCalculation(operation: .multiplication)
    }
    func division() {
        makeCalculation(operation: .division)
    }
    func makeResult() {
        makeCalculation(operation: currentOperation)
    }
    func acAction() {
        currentNumber = ""
        firstNumber = 0.0
        secondNumber = 0.0
        result = ""
        currentOperation = Operations.noAction
        displayView.updateDisplay(text: currentNumber)
        
    }
}
