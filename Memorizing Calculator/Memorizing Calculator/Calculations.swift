//
//  Calculations.swift
//  Memorizing Calculator
//
//  Created by Trevin Wisaksana on 11/16/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

class Calculations {
    
    // MARK: - Array
    var numbersArray = [Int]()
    
    var calculation = ""
    
    // MARK: - Functions
    func receiveNumbers(number: Int) {
        numbersArray.append(number)
    }

    func multiplicationOrAddition(numbers: [Int], operation: (Int, Int) -> Int) -> Int {
        let total = numbers.reduce(1, operation)
        return total
    }
    
    
    func division(numbers: [Int]) -> Int {
        return 0
    }
    
    
    func substraction(numbers: [Int]) -> Int {
        let result = numbers[0] - numbers[1]
        return result
    }
    
}




