//
//  ViewController.swift
//  Memorizing Calculator
//
//  Created by Trevin Wisaksana on 11/16/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

enum State: String {
    case substraction = "-"
    case addition = "+"
    case division = "÷"
    case multiplication = "x"
}

protocol CalculationsDataDelegate {
    func sendCalculations(calculations: Calculations)
}

class CalculateViewController: UIViewController {
    
    // MARK: - Objects
    
    var calculateObject = Calculations()
    var results = ""
    var total = 0
    var state: State!
    var delegate: CalculationsDataDelegate!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Number Button Actions
   
    @IBAction func buttonPadAction(_ sender: UIButton) {
        let button = sender.currentTitle!
        calculateObject.receiveNumbers(number: Int(button)!)
        calculateObject.calculation.append(button)
        let calculationAppear = calculateObject.calculation
        resultLabel.text = calculationAppear
        print(calculateObject.calculation)
    }
    
    // MARK: - Calcuation Operator Button Actions
    
    @IBAction func operatorButtonAction(_ sender: UIButton) {
        let button = sender.currentTitle!
        results.append(button)
        resultLabel.text = results
        switch button {
        case "=":
            switch state! {
            case .substraction:
                let result = calculateObject.substraction(numbers: calculateObject.numbersArray)
                resultLabel.text = String(result)
            case .addition:
                let result = calculateObject.multiplicationOrAddition(numbers: calculateObject.numbersArray, operation: +)
                resultLabel.text = String(result - 1)
            case .division:
                let result = calculateObject.multiplicationOrAddition(numbers: calculateObject.numbersArray, operation: /)
                resultLabel.text = String(result)
            case .multiplication:
                let result = calculateObject.multiplicationOrAddition(numbers: calculateObject.numbersArray, operation: *)
                resultLabel.text = String(result)
            }
        case "+":
            state = .addition
        case "–":
            state = .substraction
        case "x":
            state = .multiplication
        case "÷":
            state = .division
        case "AC":
            calculateObject.numbersArray.removeAll()
            results = ""
            resultLabel.text = nil
        default:
            break
        }
    }    
    
    // MARK: - Standard Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

