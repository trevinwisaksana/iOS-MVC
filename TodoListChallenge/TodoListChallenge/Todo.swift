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
    var taskTitle: String!
    /// Deadline for each task which is Optional
    var deadline: Date?
    
    // Initializing the uninitialized variables
    init(taskTitle: String, deadline: Date) {
        self.taskTitle = taskTitle
        self.deadline = deadline
    }
    
}
