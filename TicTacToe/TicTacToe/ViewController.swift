//
//  ViewController.swift
//  TicTacToe
//
//  Created by Trevin Wisaksana on 12/6/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let board = BoardView(boardWidth: 300, boardHeight: 300)
        board.center = view.center
        view.addSubview(board)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





