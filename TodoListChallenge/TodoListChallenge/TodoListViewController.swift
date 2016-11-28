//
//  TodoListViewController.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController, UIPopoverPresentationControllerDelegate, NewTaskDelegate {
    
    // Necessary IBOutlet
    @IBOutlet weak var todoListCollectionViewOutlet: UICollectionView!
    
    func addNewTask(task: Todo) {
        listOfTask.append(task)
    }
    
    // Necessary IBAction
    @IBAction func closePopover(segue: UIStoryboardSegue) {
        
    }
    
    // var collectionView: UICollectionView!
    
    var listOfTask = [Todo]() {
        didSet {
            todoListCollectionViewOutlet.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newTodo" {
            let addTodoPopover = segue.destination as! AddTodoViewController
            addTodoPopover.popoverPresentationController?.delegate = self
            
            // Setting the delegate to this specific view controller
            let addTodoViewController = segue.destination as! AddTodoViewController
            addTodoViewController.delegate = self
            
        } else {
            let viewTodoPopover = segue.destination as! TodoViewController
            viewTodoPopover.popoverPresentationController?.delegate = self
        }
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

}


extension TodoListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfTask.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /// Casts the cell into the specific TodoCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todoCell", for: indexPath) as! TodoCollectionViewCell
    
        let taskIndex = listOfTask[indexPath.row]
        
        popoverPresentationController?.sourceView = collectionView
        popoverPresentationController?.sourceRect = cell.frame
        
        // cell.deadlineLabel.text = taskIndex.deadline
        cell.taskTitleLabel.text = taskIndex.taskTitle
        
        // Curve the edges.
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 13
        
        return cell
    }
    
}
