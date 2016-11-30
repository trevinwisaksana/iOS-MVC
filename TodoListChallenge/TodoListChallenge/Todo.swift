//
//  Todo.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import Foundation

class Todo {
    /// Title for each task
    var taskTitle: String?
    /// Deadline for each task which is Optional
    var deadline: String?
    /// Completion state
    var state: CompletionState!
    
    // Initializing the uninitialized variables
    init(taskTitle: String, deadline: String, state: CompletionState) {
        self.taskTitle = taskTitle
        self.deadline = deadline
        self.state = state
    }
    
}
