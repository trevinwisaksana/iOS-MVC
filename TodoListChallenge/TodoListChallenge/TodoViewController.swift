//
//  TodoViewController.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

enum CompletionState {
    case complete, incomplete
}

class TodoViewController: UIViewController {
    
    // Necessary Objects
    var state: CompletionState!
    // Used to identify whether the complete button has been tapped
    var firstTap = false
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func completeStatusButtonAction(_ sender: UIButton) {
        
        // Button status setup to set the default button state
        if firstTap == false {
            state = .incomplete
            firstTap = true
        }
        
        // Changes the status of the button when pressed
        if state == .complete {
            state = .incomplete
        } else {
            state = .complete
        }
        
        // Changes the color and title of the button
        switch state! {
        case .complete:
            sender.setTitle("Complete", for: .normal)
            sender.backgroundColor = UIColor(colorLiteralRed: 121/255, green: 222/255, blue: 131/255, alpha: 1)
        case .incomplete:
            sender.setTitle("Incomplete", for: .normal)
            sender.backgroundColor = UIColor(colorLiteralRed: 48/255, green: 190/255, blue: 249/255, alpha: 1)
        }
    }
    
    
    @IBAction func deleteTaskButtonAction(_ sender: UIButton) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
