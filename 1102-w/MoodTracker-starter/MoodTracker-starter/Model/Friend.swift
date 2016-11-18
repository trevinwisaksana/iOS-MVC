//
//  Friend.swift
//  MoodTracker-starter
//
//  Created by Trevin Wisaksana on 11/4/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

// MARK: Friend contains the attributes of a friend.
class Friend {
    let name: String
    var mood: Mood
    
    init(name: String, mood: Mood) {
        self.name = name
        self.mood = mood
    }
}
