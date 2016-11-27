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

class CalculateViewController: UIViewController, CalculationsDataDelegate {
    
    func sendCalculations(calculations: String) -> Calculations {
        let newCalculation = Calculations(calculation: calculations)
        return newCalculation
    }
    
    // MARK: - Objects

    /// Array used to contain the numbers used to make calculations
    var calculatingNumbersArray = [Int]()
    /// Sets the operation of the calculator
    var calculatorState: CalculatorState!
    /// Stores the result
    var total: Int!
    
    
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
    
    @IBAction func backButton(segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func seePreviousCalculationsAction(_ sender: UIButton) {
        
    }
    
    @IBAction func clearButtonAction(_ sender: UIButton) {
        // Clearing up the label
        resultLabel.text = nil
        // Clearing the array
        calculatingNumbersArray.removeAll()
    }
    
    @IBAction func equalsButtonAction(_ sender: AnyObject) {
        switch calculatorState! {
        case .division:
            let result = division(numbers: calculatingNumbersArray)
            total = result
        case .addition:
            let result = multiplicationOrAddition(numbers: calculatingNumbersArray, operation: +)
            total = result
        case .multiplication:
            let result = multiplicationOrAddition(numbers: calculatingNumbersArray, operation: *)
            total = result
        case .substraction:
            let result = substraction(numbers: calculatingNumbersArray)
            total = result
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /// Used to hook the segue to the UINavigationController first
        let destination = segue.destination as! UINavigationController
        /// Hooks the UINavigationController to the CalculationsTableViewController
        let calculationsTableViewController = destination.viewControllers.first! as! CalculationsTableViewController
        /// Refers the delegate and set it to be of type calculationsTableViewController
        calculationsTableViewController.delegate = self
        
        /// Using the function to change from String into Calculation class
        let newCalculation = sendCalculations(calculations: resultLabel.text!)
        /// Appending new calculations to the calculation list
        calculationsTableViewController.calculationsList.append(newCalculation)
    }

}

