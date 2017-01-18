//
//  PathDayTimePriorityTableViewController.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/14/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit
import os.log

class PathDayTimePriorityTableViewController: UITableViewController {
    
    //MARK: Proprerties
    var pathDayTimePriorities = [PathDayTimePriority]()

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pathDayTimePriorities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PathDayTimePriorityTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PathDayTimePriorityTableViewCell  else {
            fatalError("The dequeued cell is not an instance of PathDayTimePriorityTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let pathDayTimePriority = pathDayTimePriorities[indexPath.row]
        
        cell.pathFromLabel.text = pathDayTimePriority.pathFromDate
        cell.pathToLabel.text = pathDayTimePriority.pathToDate
        cell.pathDayTimePriorityLabel.text = pathDayTimePriority.dayTimePriority
        
        return cell
        
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            pathDayTimePriorities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddPathDayTimePriority":
            os_log("Adding a new priority.", log: OSLog.default, type: .debug)
            
        case "ShowPathDayTimePriority":
            guard let PathDayTimePriorityDetailViewController = segue.destination as? PathDayTimePriorityViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedPriorityCell = sender as? PathDayTimePriorityTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedPriorityCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedPriority = pathDayTimePriorities[indexPath.row]
            PathDayTimePriorityDetailViewController.pathDayTimePriority = selectedPriority
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    
    //MARK: Actions
    
    @IBAction func unwindToPathPriorityList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? PathDayTimePriorityViewController, let PathDayTimePriority = sourceViewController.pathDayTimePriority {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing priority.
                pathDayTimePriorities[selectedIndexPath.row] = PathDayTimePriority
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            
            else {
                // Add a new priority.
                let newIndexPath = IndexPath(row: pathDayTimePriorities.count, section: 0)
                
                pathDayTimePriorities.append(PathDayTimePriority)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }

}
