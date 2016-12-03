//
//  TodoListViewController.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

protocol UpdateTodoDelegate {
    func updateTask(task: Todo)
}

class TodoListViewController: UIViewController, UIPopoverPresentationControllerDelegate, NewTaskDelegate, TodoCellDelegate,  UpdateCompletionButton {
    
    // MARK: - Necessary objects
    var delegate: UpdateTodoDelegate!
    var selectedTodoIndex: Int!
    var state: CompletionState!
    
    // Necessary IBOutlet
    @IBOutlet weak var todoListCollectionViewOutlet: UICollectionView!
    
    // MARK: - Necessary methods
    func addNewTask(task: Todo) {
        listOfTask.append(task)
    }
    
    // Allows the completion buttons to change on both the cell and the TodoViewController
    func updateCompletionButton(task: Todo, updatedState: CompletionState) {
        task.state = updatedState
        todoListCollectionViewOutlet.reloadData()
    }
    
    // Allows the cell button to update the completion state
    func updateTodo(task: Todo, newState: CompletionState) {
        // Changes the state to change color
        task.state = newState
        todoListCollectionViewOutlet.reloadData()
    }
    
    // Allows the completion state to change
    func updateCompletionState(state: CompletionState) -> CompletionState {
        // When the button is tapped, it changes the state
        switch state {
        case .incomplete: return .complete
        case .complete: return .incomplete
        }
    }
    
    // MARK: - Necessary IBAction
    @IBAction func closePopover(segue: UIStoryboardSegue) {
        // Used for unwind segue
        
    }
    
    @IBAction func deleteCell(segue: UIStoryboardSegue) {
        listOfTask.remove(at: selectedTodoIndex)
    }
    
    var listOfTask = [Todo]() {
        didSet {
            todoListCollectionViewOutlet.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newTodo" {
            let addTodoPopover = segue.destination as! AddTodoViewController
            addTodoPopover.popoverPresentationController?.delegate = self
            
            // Setting the delegate to this specific view controller
            addTodoPopover.delegate = self
            
        } else if segue.identifier == "viewTodo" {
            let viewTodoPopover = segue.destination as! TodoViewController
            viewTodoPopover.popoverPresentationController?.delegate = self
        
            // Used to access each task in the list
            viewTodoPopover.task = listOfTask[selectedTodoIndex]
            
            viewTodoPopover.delegate = self
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

}

// MARK: - Extension

extension TodoListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfTask.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /// Casts the cell into the specific TodoCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todoCell", for: indexPath) as! TodoCollectionViewCell
    
        let taskIndex = listOfTask[indexPath.row]
        
        cell.deadlineLabel.text = taskIndex.deadline
        cell.taskTitleLabel.text = taskIndex.taskTitle
        
        cell.delegate = self
        cell.task = taskIndex
        
        // Changing the button color and label. When tapped, this is called again.
        switch taskIndex.state! {
        case .complete:
            cell.completionStateButton.backgroundColor = UIColor(colorLiteralRed: 121/255, green: 222/255, blue: 131/255, alpha: 1)
        case .incomplete:
            cell.completionStateButton.backgroundColor = UIColor(colorLiteralRed: 48/255, green: 190/255, blue: 249/255, alpha: 1)
        }
        
        // Curve the edges.
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 13
        
        popoverPresentationController?.sourceView = collectionView
        popoverPresentationController?.sourceRect = cell.frame
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        // Used to access the specific cell in the list
        selectedTodoIndex = indexPath.row
    }
    
}
