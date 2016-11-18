//
//  FriendTableViewCell.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

protocol FriendsTableViewCellDelegate {
    func updateFriend(friend: Friend, newMood: Mood)
    func changeMood(mood: Mood) -> Mood
}

class FriendTableViewCell: UITableViewCell {
    
    var delegate: FriendsTableViewCellDelegate!
    
    // Declaring a variable of type Friend
    var friend: Friend!
    
    // This is conneted to the name label on the FriendTableViewCell.
    @IBOutlet weak var nameLabel: UILabel!
    
    // This is connected to the status label on the the FriendTableViewCell.
    @IBOutlet weak var statusLabel: UILabel!
    
    // This is connected to the mood button but does not carry an action.
    @IBOutlet weak var moodButtonOutlet: UIButton!
    
    // moodButtionAction sends an instruction to the View Controller to change the mood when tapped
    @IBAction func moodButtonAction(_ sender: Any) {
        let newMood = delegate.changeMood(mood: friend!.mood)
        delegate.updateFriend(friend: friend, newMood: newMood)
    }
    
}
