//
//  TableViewController.swift
//  Memorizing Calculator
//
//  Created by Trevin Wisaksana on 11/21/16.
//  Copyright © 2016 Trevin Wisaksana. All rights reserved.
//

import UIKit

class CalculationsTableViewController: UITableViewController, CalculationsDataDelegate {
    
    func sendCalculations(calculations: Calculations) {
        calculationsList.append(calculations)
        tableView.reloadData()
    }
    
    var calculationsList = [Calculations]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return calculationsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CalculationsTableViewCell

        // Configure the cell...
        let calculationsCellIndex = calculationsList[indexPath.row]
        cell.calculationLabel.text = calculationsCellIndex.calculation
        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! UINavigationController
        let calculateViewController = destination.viewControllers.first! as! CalculateViewController
        calculateViewController.delegate = self
    }
}
