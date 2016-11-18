//
//  FriendsTableViewController.swift
//  MoodTracker-starter
//
//  Created by Trevin Wisaksana on 02/11/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.

//  Controller is where we place the links between the Model and the View. It also contains the logic of the application and it updates the Model and the View.

import UIKit

class FriendsTableViewController: UITableViewController, DataSentDelegate, FriendsTableViewCellDelegate {
    
    func userDidCreateFriend(data: Friend) {
        friendsList.append(data)
    }
    
    // Used as a placeholder to connect the Add Button to the FriendsTableViewController for unwind segue.
    @IBAction func addFriend(segue:UIStoryboardSegue) {
        
    }
    
    // An array of friends.
    var friendsList = [Friend]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // The number of the object on the Table View depends on the number of items in the friendsList array.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // cell stores the specific type of cell which is the FriendTableViewCell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
        
        // Storing the friendlist index path to the friendIndex.
        let friendIndex = friendsList[indexPath.row]
        
        // Assigning the name label on the cel as the friendIndex.name.
        cell.nameLabel.text = friendIndex.name
        
        // Assigning the mood emoji to the button title (it's a title because the emoji is considered a String).
        cell.moodButtonOutlet.setTitle(friendIndex.mood.rawValue, for: .normal)
        
        // Assigning delegate to self
        cell.delegate = self
        
        // Assigning the friend to the friendsList[indexPath.row]
        cell.friend = friendIndex
        
        // Assigning the mood status to the appropriate mood.
        switch friendIndex.mood {
        case .angry:
            cell.statusLabel.text = "How dare you?"
        case .bored:
            cell.statusLabel.text = "What is love? Baby don't hurt me no more."
        case .happy:
            cell.statusLabel.text = "Cause I'm happy clap a long if you feel like that's what you wanna do!"
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! UINavigationController
        let addFriendViewController = destination.viewControllers.first! as! AddFriendViewController
        addFriendViewController.delegate = self
    }
    
    // Update friend
    func updateFriend(friend: Friend, newMood: Mood) {
        // Assigning the new mood to the friend
        friend.mood = newMood
        // Updating the view from the View Controller
        tableView.reloadData()
    }
    
    // New Mood keeps track of the new mood
    func changeMood(mood: Mood) -> Mood {
        switch mood {
        case .happy: return .angry
        case .angry: return .bored
        case .bored: return .happy
        }
    }
    
}
