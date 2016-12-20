//
//  Todo.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Todo: Object {
    /// Title for each task
    dynamic var taskTitle: String?
    /// Deadline for each task which is Optional
    dynamic var deadline: String?
    /// Completion state
    var state: CompletionState!
    
    // Initializing the uninitialized variables
    init(taskTitle: String, deadline: String, state: CompletionState) {
        super.init()
        self.taskTitle = taskTitle
        self.deadline = deadline
        self.state = state
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
}
