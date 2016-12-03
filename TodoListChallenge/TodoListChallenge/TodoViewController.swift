//
//  TodoViewController.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

protocol UpdateCompletionButton {
    func updateCompletionButton(task: Todo, updatedState: CompletionState)
}

class TodoViewController: UIViewController, UpdateTodoDelegate {
    
    // Necessary variables
    var delegate: UpdateCompletionButton!
    var currentState: Todo!
    
    // Necessary Methods
    func updateTask(task: Todo) {
        taskTitleLabel.text = task.taskTitle
        deadlineLabel.text = task.deadline
    }
    
    // Necessary Objects
    // var delegate: ViewTodoDelegate!
    var task: Todo! {
        didSet {
            // TODO: Update UI with model data...
            
        }
    }
    
    // Used to identify whether the complete button has been tapped
    var firstTap = false
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var completionStateButton: UIButton!
    
    // MARK: - IBActions
    
    @IBAction func completeStatusButtonAction(_ sender: UIButton) {
        changeButtonState(button: sender)
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
    
    override func viewWillAppear(_ animated: Bool) {
        // changeButtonState(button: completionStateButton)
        changeButtonAttributes(button: completionStateButton)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let todoListViewController = segue.destination as! TodoListViewController
        todoListViewController.delegate = self
    }
    
    func changeButtonAttributes(button: UIButton) {
        switch task.state! {
        case .complete:
            button.setTitle("Complete", for: .normal)
            button.backgroundColor = UIColor(colorLiteralRed: 121/255, green: 222/255, blue: 131/255, alpha: 1)
        case .incomplete:
            button.setTitle("Incomplete", for: .normal)
            button.backgroundColor = UIColor(colorLiteralRed: 48/255, green: 190/255, blue: 249/255, alpha: 1)
        }
    }
    
    func changeButtonState(button: UIButton) {
        // Changes the status of the button when pressed
        if task.state == .complete {
            // Using the delegate to send the button status to incomplete
            delegate.updateCompletionButton(task: task, updatedState: .incomplete)
        } else {
            // Using delegate to change button status to complete
            delegate.updateCompletionButton(task: task, updatedState: .complete)
        }
        // Changes the color and title of the button
       changeButtonAttributes(button: button)
        
    }
    
}
