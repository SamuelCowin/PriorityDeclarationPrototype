//
//  RoadPriorityTableViewController.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/12/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit

class RoadPriorityTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var roadPriorities = [RoadPriority]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSamplePriority()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roadPriorities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "RoadPriorityTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RoadPriorityTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RoadPriorityTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let priority = roadPriorities[indexPath.row]
        
        cell.toDateLabel.text = priority.toDate
        cell.fromDateLabel.text = priority.fromDate
        //cell.valueLabel.text = String (priority.priorityValue)

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    //MARK: Navigation
    
    
    //MARK: Actions
    @IBAction func unwindToPriorityList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? RoadNewSettingViewController, let priority = sourceViewController.priority {
            
            // Add a new priority.
            let newIndexPath = IndexPath(row: roadPriorities.count, section: 0)
            
            roadPriorities.append(priority)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
    }
    
    //MARK: Private Methods
    
    private func loadSamplePriority() {
        
        guard let priority1 = RoadPriority(fromDate: "Hello", toDate: "World") else {
            fatalError("Unable to instantiate priority1")
        }
        
        roadPriorities += [priority1]
    }


}
