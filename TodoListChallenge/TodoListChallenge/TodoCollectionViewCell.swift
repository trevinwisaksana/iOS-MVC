//
//  TodoCollectionViewCell.swift
//  TodoListChallenge
//
//  Created by Trevin Wisaksana on 11/27/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

protocol TodoCellDelegate {
    
}

class TodoCollectionViewCell: UICollectionViewCell {
    
    /// MARK: - IBOutlets
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction func checklistButtonAction(_ sender: Any) {
    }
    
}
