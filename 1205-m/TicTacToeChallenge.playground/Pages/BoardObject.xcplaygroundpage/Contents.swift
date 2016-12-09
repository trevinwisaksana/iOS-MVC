//: [Previous](@previous)

import Foundation

enum BoardState {
    case o, x
}

/* THINGS I'VE DONE:
 – Winner method works
 – Grid system works
 –
*/

// Be advised, the logic I made is very confusing.
class BoardObject {
    
    private var currentTurn: BoardState!
    private var alreadyRuns = false
    
    // Creating it's own grid to be independent from the user interface
    var grid: [[String]] = [["0", "0", "0"],
                            ["0", "0", "0"],
                            ["0", "0", "0"]]
    
    private func determineCurrentTurn() -> BoardState {
        switch currentTurn! {
        case .x:
            return .o
        case .o:
            return .x
        }
    }
    
    private func returnXorO(turn: BoardState) -> String {
        switch turn {
        case .x: return "x"
        case .o: return "o"
        }
    }
    
    public func moveTo(x: Int, y: Int) {
        if alreadyRuns == false {
            alreadyRuns = true
            currentTurn = .o
        }
        let chosenTurn = determineCurrentTurn()
        let returnedState = returnXorO(turn: chosenTurn)
        // ACHTUNG! X and Y are inverted here. This is because we are accessing nested arrays.
        grid[y][x] = returnedState
    }
    
    /// Uses these conditions
    private func conditions(XValue: Int, YValue: Int, symbol: String) -> Bool {
        
        let firstCondition = (grid[XValue][0].contains(symbol)) && (grid[XValue][1].contains(symbol)) && (grid[XValue][2].contains(symbol))
        
        let secondCondition = (grid[0][YValue].contains(symbol)) && (grid[1][YValue].contains(symbol)) && (grid[2][YValue].contains(symbol))
        
        let thirdCondition = (grid[0][YValue].contains(symbol)) && (grid[1][1].contains(symbol)) && (grid[2][XValue].contains(symbol))
        
        if firstCondition || secondCondition || thirdCondition {
            return true
        }
        return false
    }
    
    public func winner() -> String {
        // Has to be -1 because it skips 0 if it doesn't start with -1
        var XValue = -1
        var YValue = -1
        
        // Loops 9 times as there are 9 total elements in the nested array
        for i in 0...8 {
            if (i % 3 != 0) {
                XValue += 1
            } else {
                XValue = 0
                YValue += 1
            }
            
            if conditions(XValue: XValue, YValue: YValue, symbol: "x") == true {
                return "Cross wins"
            } else if conditions(XValue: XValue, YValue: YValue, symbol: "y") == true {
                return "Circle wins"
            } else {
                return "There are no winners"
            }
        }
        return "Loading..."
    }
}

let board = BoardObject()
board.moveTo(x: 0, y: 0)
board.moveTo(x: 0, y: 1)
board.moveTo(x: 0, y: 2)
board.winner()

//: [Next](@next)
