//: [Previous](@previous)

import Foundation

protocol Computable {
    func compute() -> Int
}

class Sum: Computable {
    var numbers = [1,2,3,4,5,6,7,8,9]
    func compute() -> Int {
        let totalSum = numbers.reduce(0, +)
        return totalSum
    }
}

class Product: Computable {
    var numbers = [1,2,3,4,5,6,7,8,9]
    func compute() -> Int {
        let totalProduct = numbers.reduce(1, *)
        return totalProduct
    }
}

class CountCharacters: Computable {
    var string: String = "odinfeoivneflndwcnervbunlinwe;dqwmid"
    func compute() -> Int {
        let numberOfCharacters = string.characters.count
        return numberOfCharacters
    }
}

/* class Random: Computable {
    var string: String = "odinfeoivneflndwcnervbunlinwe;dqwmid"
    func compute() -> Int {
        for letter in string.characters {
            
        }
    }
} */

let sum = Sum().compute()
let product = Product().compute()
let countCharacters = CountCharacters().compute()
// let random = Random()


let arrayOfComputables = [sum, product, countCharacters /*, random*/] as [Any]

/*:
 **Tasks**: 
 1. Uncomment above line and make the code compile (by implementing the `Computable` protocol in all the classes)
 2. Iterate over `arrayOfComputables`, _compute_ each result and print it to the console using `print`
 */

