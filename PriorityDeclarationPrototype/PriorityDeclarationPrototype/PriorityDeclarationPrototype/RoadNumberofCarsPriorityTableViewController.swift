//
//  RoadNumberofCarsPriorityTableViewController.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/14/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit
import os.log

class RoadNumberofCarsPriorityTableViewController: UITableViewController {
    
    //Properties
    
    var roadNumberofCarsPriorities = [RoadNumberCarsPriority]()

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
       return roadNumberofCarsPriorities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "RoadNumberofCarsPriorityTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RoadNumberofCarsPriorityTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RoadNumberofCarsPriorityTableViewCell.")
        }
        
        // Fetches the appropriate priority for the data source layout.
        let roadNumberofCarsPriority = roadNumberofCarsPriorities[indexPath.row]
        
        cell.minCarsLabel.text = roadNumberofCarsPriority.minNumber
        cell.maxCarsLabel.text = roadNumberofCarsPriority.maxNumber
        cell.roadNumberPriorityValue.text = roadNumberofCarsPriority.numberPriority
        
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
            roadNumberofCarsPriorities.remove(at: indexPath.row)
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
            
        case "AddRoadNumberCarsPriority":
            os_log("Adding a new priority.", log: OSLog.default, type: .debug)
            
        case "ShowRoadNumberCarsPriority":
            guard let RoadNumberCarsPriorityDetailViewController = segue.destination as? RoadNumberofCarsPriorityViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedPriorityCell = sender as? RoadNumberofCarsPriorityTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedPriorityCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedPriority = roadNumberofCarsPriorities[indexPath.row]
            RoadNumberCarsPriorityDetailViewController.roadNumberOfCarsPriority = selectedPriority
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    
    //MARK: Actions
    
    @IBAction func unwindToRoadNumberCarsList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? RoadNumberofCarsPriorityViewController, let roadNumberOfCarsPriority = sourceViewController.roadNumberOfCarsPriority {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing priority.
                roadNumberofCarsPriorities[selectedIndexPath.row] = roadNumberOfCarsPriority
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            
            else {
                // Add a new priority.
                let newIndexPath = IndexPath(row: roadNumberofCarsPriorities.count, section: 0)
                
                roadNumberofCarsPriorities.append(roadNumberOfCarsPriority)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }

}
