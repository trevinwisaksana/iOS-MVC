//
//  TodoViewController.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

protocol UpdateCompletionButton {
    func updateCompletionButton(todo: Todo, state: CompletionState)
}

class TodoViewController: UIViewController, UpdateTodoDelegate {
    
    // Necessary variables
    var delegate: UpdateCompletionButton!
    
    // Necessary Methods
    func updateTask(task: Todo) {
        taskTitleLabel.text = task.taskTitle
        deadlineLabel.text = task.deadline
    }
    
    // Necessary Objects
    // var delegate: ViewTodoDelegate!
    var task: Todo! {
        didSet {
            
        }
    }
    
    // Used to identify whether the complete button has been tapped
    var firstTap = false
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func completeStatusButtonAction(_ sender: UIButton) {
        
        // Button status setup to set the default button state
        if firstTap == false {
            task.state = .incomplete
            firstTap = true
        }
        
        // Changes the status of the button when pressed
        if task.state == .complete {
            // task.state = .incomplete
            delegate.updateCompletionButton(todo: task, state: .incomplete)
        } else {
            // task.state = .complete
            delegate.updateCompletionButton(todo: task, state: .complete)
        }
        
        // Changes the color and title of the button
        switch task.state! {
        case .complete:
            sender.setTitle("Complete", for: .normal)
            sender.backgroundColor = UIColor(colorLiteralRed: 121/255, green: 222/255, blue: 131/255, alpha: 1)
        case .incomplete:
            sender.setTitle("Incomplete", for: .normal)
            sender.backgroundColor = UIColor(colorLiteralRed: 48/255, green: 190/255, blue: 249/255, alpha: 1)
        }
    }
    
    
    @IBAction func deleteTaskButtonAction(_ sender: UIButton) {
        // TODO: Implement delete button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskTitleLabel.text = task.taskTitle
        deadlineLabel.text = task.deadline
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let todoListViewController = segue.destination as! TodoListViewController
        todoListViewController.delegate = self
    }
    
}
