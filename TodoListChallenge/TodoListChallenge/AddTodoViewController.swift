//
//  AddTodoViewController.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

protocol NewTaskDelegate {
    func addNewTask(task: Todo)
}

class AddTodoViewController: UIViewController {
    
    // Necessary objects
    
    var delegate: NewTaskDelegate!
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var todoTitleTextField: UITextField!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var datePickerOutlet: UIDatePicker!

    
    // MARK: - IBAction
    
    @IBAction func createNewTaskButtonAction(_ sender: Any) {
        let newTodo = Todo(taskTitle: todoTitleTextField.text!, deadline: datePickerOutlet.date)
        delegate.addNewTask(task: newTodo)
        
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        deadlineLabel.text = String(describing: sender.date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(datePickerOutlet.date)
    }

}
