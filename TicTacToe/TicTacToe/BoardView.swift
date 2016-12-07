//
//  BoardView.swift
//  TicTacToe
//
//  Created by Trevin Wisaksana on 12/6/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import Foundation
import UIKit

// MARK: - BoardView Class
class BoardView: UIView, UIGestureRecognizerDelegate {
    
    // MARK: - Setting the board
    // Objects to setup board
    private var boardWidth: Int! // Variable with type CGFloat
    private var boardHeight: Int! // Variable with type CGFloat
    private var boardState: BoardState! = .o
    
    // MARK: - Initializer
    init(boardWidth: Int, boardHeight: Int) {
        // Placing the frame attributes
        super.init(frame: CGRect(x: 0, y: 0, width: boardWidth, height: boardHeight))
        
        // Initializing the board attributes
        self.boardWidth = boardWidth
        self.boardHeight = boardHeight
        self.backgroundColor = UIColor.white
        
        // Used for debugging purposes to compare the location of the fields and the canvas.
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
        // Initializing the loop to create field method
        self.loopToCreateField()
        
    }
    
    // Required initializer
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting the Field
    // Creating Board method
    private func creatingField(positionX: Int, positionY: Int) {
        
        let widthValue = Int((self.frame.size.width) * (1/3))
        let heightValue = Int((self.frame.size.height) * (1/3))
        
        // Setup and create field
        let sizeAndPosition = CGRect(x: positionX, y: positionY, width: widthValue, height: heightValue)
        let field = UIView(frame: sizeAndPosition)
        
        // Setup field attributes
        field.backgroundColor = .white
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        
        // Setup for Tap Gesture
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tapGesture))
        gesture.delegate = self
        field.addGestureRecognizer(gesture)
        
        // Creating a label in each field
        let labelFrame = CGRect(x: positionX, y: positionY, width: widthValue, height: heightValue)
        let label = UILabel.init(frame: labelFrame)
        label.font = UIFont(name: "Helvetica", size: 40)
        label.textColor = UIColor.black
        self.boardObjectsAppear(label: label)
        self.addSubview(label)
        
        // Adding the field to the canvas
        self.addSubview(field)
        
    }
    
    private func boardObjectsAppear(label: UILabel) {
        print("Drawn")
        switch boardState! {
        case .x:
            label.text = boardState.rawValue
        case .o:
            label.text = boardState.rawValue
        }
    }
    
    // MARK: - Tap method
    @objc private func tapGesture(sender: UITapGestureRecognizer) {
        print("Used")
        switch boardState! {
        case .x: boardState = .o
        case .o: boardState = .x
        }
    }
    
    // MARK: - Loop Method
    private func loopToCreateField() {
        
        // Position of the field
        var XPositionOfField = 0
        var YPositionOfField = -100
        
        // Creating the board
        for i in 0...8 {
            if (i % 3 != 0) {
                XPositionOfField += Int((self.frame.size.width) * (1/3))
            } else {
                XPositionOfField = 0
                YPositionOfField += Int((self.frame.size.height) * (1/3))
            }
            self.creatingField(positionX: XPositionOfField , positionY: YPositionOfField)
        }
        
    }
    
}


