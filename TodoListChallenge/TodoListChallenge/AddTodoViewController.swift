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

class AddTodoViewController: UIViewController, UITextFieldDelegate {
    
    // Necessary objects
    
    var delegate: NewTaskDelegate!
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var todoTitleTextField: UITextField!
    
    @IBOutlet weak var deadlineTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func createNewTaskButtonAction(_ sender: Any) {
        let newTodo = Todo(taskTitle: todoTitleTextField.text!, deadline: deadlineTextField.text!)
        delegate.addNewTask(task: newTodo)
        
    }
    
    @IBAction func deadlineTextField(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datePicker = UIDatePicker()
        deadlineTextField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(AddTodoViewController.setDeadline(sender:)), for: .valueChanged)
    }
    
    func setDeadline(sender: UIDatePicker!) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        deadlineTextField.text = formatter.string(from: sender.date)
    }

}
