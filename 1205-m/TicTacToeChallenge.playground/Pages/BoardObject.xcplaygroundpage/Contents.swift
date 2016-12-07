//: [Previous](@previous)

import Foundation

enum BoardState {
    case o, x
}

class BoardObject {
    // TODO: - Create current turn method
        // Doesn't allow the same player to move twice 
        // Sets the current turn
    // TODO: - Create winner method
        // Checks if an object has filled three boxes
        // Places nil if there's no winner yet 
        // Places draw if there's no winner
    // TODO: - Create move method
        // Takes an X and Y position
        // Create an array which mimics the grid
        // Assigns each part of the array to the grid
    
    var currentTurn: BoardState!
    var alreadyRuns = false
    
    var grid: [[String]] = [["0", "0", "0"],
                            ["0", "0", "0"],
                            ["0", "0", "0"]]
    
    func determineCurrentTurn() -> BoardState {
        switch currentTurn! {
        case .x:
            print("Circle")
            return .o
        case .o:
            print("Cross")
            return .x
        }
    }
    
    func returnXorO(turn: BoardState) -> String {
        switch turn {
        case .x: return "x"
        case .o: return "o"
        }
    }
    
    func moveTo(x: Int, y: Int) {
        if alreadyRuns == false {
            alreadyRuns = true
            currentTurn = .o
        }
        
        let chosenTurn = determineCurrentTurn()
        let returnedState = returnXorO(turn: chosenTurn)
        grid[y][x] = returnedState
        print(grid)
    }
    
    func winner() {
        if (grid[0][0].contains("x")) && (grid[0][0].contains("x")) && (grid[0][0].contains("x")) {
            print("x")
        } else if (grid[0][1].contains("x")) && (grid[1][1].contains("x")) && (grid[2][1].contains("x")) {
            print("x")
        } else if (grid[0][2].contains("x")) && (grid[1][2].contains("x")) && (grid[2][2].contains("x")) {
            print("x")
        } else if (grid[0][0].contains("x")) && (grid[0][1].contains("x")) && (grid[0][2].contains("x")) {
            print("x")
        } else if (grid[1][0].contains("x")) && (grid[1][1].contains("x")) && (grid[1][2].contains("x")) {
            print("x")
        } else if (grid[2][0].contains("x")) && (grid[2][1].contains("x")) && (grid[2][2].contains("x")) {
            print("x")
        } else if (grid[2][0].contains("x")) && (grid[1][1].contains("x")) && (grid[0][2].contains("x")) {
            print("x")
        } else if (grid[0][0].contains("x")) && (grid[1][1].contains("x")) && (grid[2][2].contains("x")) {
            print("x")
        }
        
        if (grid[0][0].contains("o")) && (grid[0][0].contains("o")) && (grid[0][0].contains("o")) {
            print("o")
        } else if (grid[0][1].contains("o")) && (grid[1][1].contains("o")) && (grid[2][1].contains("o")) {
            print("o")
        } else if (grid[0][2].contains("o")) && (grid[1][2].contains("o")) && (grid[2][2].contains("o")) {
            print("o")
        } else if (grid[0][0].contains("o")) && (grid[0][1].contains("o")) && (grid[0][2].contains("o")) {
            print("o")
        } else if (grid[1][0].contains("o")) && (grid[1][1].contains("o")) && (grid[1][2].contains("o")) {
            print("o")
        } else if (grid[2][0].contains("o")) && (grid[2][1].contains("o")) && (grid[2][2].contains("o")) {
            print("o")
        } else if (grid[2][0].contains("o")) && (grid[1][1].contains("o")) && (grid[0][2].contains("o")) {
            print("o")
        } else if (grid[0][0].contains("o")) && (grid[1][1].contains("o")) && (grid[2][2].contains("o")) {
            print("o")
        }
        
    }
}

// The logic is that when you call the moveto method, the

let board = BoardObject()
board.moveTo(x: 0, y: 0)
board.moveTo(x: 1, y: 0)
board.moveTo(x: 2, y: 0)
board.winner()




//: [Next](@next)
