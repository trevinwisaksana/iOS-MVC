//
//  ViewController.swift
//  Memorizing Calculator
//
//  Created by Trevin Wisaksana on 11/16/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

// Enum to determine which mode the calculator is in
enum CalculatorState {
    case substraction
    case addition
    case division
    case multiplication
}

protocol CalculationsDataDelegate {
    func sendCalculations(calculations: Calculations)
}

class CalculateViewController: UIViewController {
    
    // MARK: - Objects

    /// Array used to contain the numbers used to make calculations
    var calculatingNumbersArray = [Int]()
    /// Delegate assigned as type CalculationsDataDelegate to access the delegate methods
    var delegate: CalculationsDataDelegate!
    /// Sets the operation of the calculator
    var calculatorState: CalculatorState!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Number Button Actions
   
    @IBAction func buttonPadAction(_ sender: UIButton) {
        /// Stores the instance of the title of the button e.g. "5" <= Button Title
        let button = sender.currentTitle!
        /// Casting type String into type Int
        if let number = Int(button) {
            /// Appends the number into the numbers array to be used for calculations
            calculatingNumbersArray.append(number)
        }
    }
    
    // MARK: - Calcuation Operator Button Actions
    
    @IBAction func equalsButtonAction(_ sender: AnyObject) {
        switch calculatorState! {
        case .division:
            division(numbers: calculatingNumbersArray)
        case .addition:
            multiplicationOrAddition(numbers: calculatingNumbersArray, operation: +)
        case .multiplication:
            multiplicationOrAddition(numbers: calculatingNumbersArray, operation: *)
        case .substraction:
            substraction(numbers: calculatingNumbersArray)
        default:
            break
        }
    }
    
    @IBAction func plusButtonAction(_ sender: AnyObject) {
        calculatorState = .addition
    }
    
    
    @IBAction func substractButtonAction(_ sender: AnyObject) {
        calculatorState = .substraction
    }
    
    
    @IBAction func multiplicationButtonAction(_ sender: AnyObject) {
        calculatorState = .multiplication
    }
    
    
    @IBAction func divisionButtonAction(_ sender: AnyObject) {
        calculatorState = .division
    }
    
    // MARK: - Functions
    
    /// Can do multiplicaiton or addition operations.
    func multiplicationOrAddition(numbers: [Int], operation: (Int, Int) -> Int) -> Int {
        // Does the calculation behind the scene
        let total = numbers.reduce(1, operation)
        // Casting the result into type String
        let result = String(total)
        // Assigning the result to the label
        resultLabel.text = result
        
        // Assigning the calculation result to a variable
        let calculation = Calculations(calculation: result)
        // Sending the calculation to the delegate
        delegate?.sendCalculations(calculations: calculation)
        
        return total
    }
    
    /// Can do division operations.
    func division(numbers: [Int]) -> Int {
        return 0
    }
    
    // Can do substraction operations.
    func substraction(numbers: [Int]) -> Int {
        let result = numbers[0] - numbers[1]
        return result
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

