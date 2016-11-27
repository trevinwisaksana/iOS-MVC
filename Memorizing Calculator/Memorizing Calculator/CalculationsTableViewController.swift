//
//  TableViewController.swift
//  Memorizing Calculator
//
//  Created by Trevin Wisaksana on 11/21/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

protocol CalculationsDataDelegate {
    func sendCalculations(calculations: String) -> Calculations
}

class CalculationsTableViewController: UITableViewController {
    
    /// Delegate assigned as type CalculationsDataDelegate to access the delegate methods
    var delegate: CalculationsDataDelegate!
    
    // Array which contains a list of all the calculations
    var calculationsList = [Calculations]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // Required method
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Returns the number of items in the array
        return calculationsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CalculationsTableViewCell

        // Assigning each index to a variable to be used later
        let calculationsCellIndex = calculationsList[indexPath.row]
        // Changing the label based on the result
        cell.calculationLabel.text = calculationsCellIndex.calculation
        return cell
    }
    
}
