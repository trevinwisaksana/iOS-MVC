//
//  AddFriendViewController.swift
//  MoodTracker-starter
//
//  Created by Trevin Wisaksana on 11/4/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

protocol DataSentDelegate {
    func userDidCreateFriend(data: Friend)
}

class AddFriendViewController: UIViewController {
    
    /// moodStatus is type Mood which gives access to the mood options.
    var moodStatus: Mood!
    
    // Creating a variable of type DataSentDelegate
    var delegate: DataSentDelegate?

    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Mood Buttons 
    /// Used to set the mood status value.
    @IBAction func happyButton(_ sender: Any) {
        moodStatus = Mood.happy
    }
    
    @IBAction func boredButton(_ sender: Any) {
        moodStatus = Mood.bored
    }
    
    @IBAction func angryButton(_ sender: Any) {
        moodStatus = Mood.angry
    }
    
    @IBAction func addFriendButton(_ sender: Any) {
        // friend contains the new Friend which the user creates.
        let friend = Friend(name: nameTextField.text!, mood: moodStatus)
        // Passing the friend to the delegate
        delegate?.userDidCreateFriend(data: friend)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
