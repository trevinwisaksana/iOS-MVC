//
//  TodoCollectionViewCell.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

protocol TodoCellDelegate {
    func updateTodo(task: Todo, newState: CompletionState)
    func updateCompletionState(state: CompletionState) -> CompletionState
}

class TodoCollectionViewCell: UICollectionViewCell {
    
    // Necessary object
    var state: CompletionState! = .incomplete
    var delegate: TodoCellDelegate!
    var task: Todo!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var completionStateButton: UIButton!
    
    // MARK: - IBActions
    @IBAction func checklistButtonAction(_ sender: UIButton) {
        // Updating the state by tapping the button
        let updatedState = delegate.updateCompletionState(state: task!.state)
        delegate.updateTodo(task: task, newState: updatedState)
    }
    
}
