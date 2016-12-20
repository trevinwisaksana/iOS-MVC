//
//  AddTodoViewController.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

protocol NewTaskDelegate {
    func addNewTask(task: Todo)
}

class AddTodoViewController: UIViewController, UITextFieldDelegate {
    
    // Necessary objects
    
    // Declaring a type Realm object to access Realm
    let realm = try! Realm()

    // Accessing the NewTaskDelegate by creating a delegate variable
    var delegate: NewTaskDelegate!
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var todoTitleTextField: UITextField!
    
    @IBOutlet weak var deadlineTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func createNewTaskButtonAction(_ sender: Any) {
        // MARK: Delegate Call
        let newTodo = Todo(taskTitle: todoTitleTextField.text!, deadline: deadlineTextField.text!, state: .incomplete)
        delegate.addNewTask(task: newTodo)
        
        // MARK: - Writing task to database
        try! realm.write() {
            // Saving the object
            realm.add(newTodo)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets up the deadline label to be able to load a UIDatePicker on the keyboard
        // MARK: Date Picker Setup
        let datePicker = UIDatePicker()
        deadlineTextField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(AddTodoViewController.setDeadline(sender:)), for: .valueChanged)
    }
    
    func setDeadline(sender: UIDatePicker!) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        deadlineTextField.text = formatter.string(from: sender.date)
    }

}
