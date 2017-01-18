//
//  PathDayTimePriorityViewController.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/12/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit
import os.log

class PathDayTimePriorityViewController: UIViewController {
    
    @IBOutlet weak var priorityValueLabel: UILabel!
    @IBOutlet weak var fromDateLabel: UILabel!
    @IBOutlet weak var toDateLabel: UILabel!
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var fromDateText: UILabel!
    @IBOutlet weak var toDateText: UILabel!
    
    @IBOutlet weak var sliderBar: UISlider!
    @IBOutlet weak var fromDatePicker: UIDatePicker!
    @IBOutlet weak var toDatePicker: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //
    
    var pathDayTimePriority: PathDayTimePriority?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set up views if editing an existing priority.
        if let pathDayTimePriority = pathDayTimePriority {
            navigationItem.title = ""
            fromDateText.text = pathDayTimePriority.pathFromDate
            toDateText.text = pathDayTimePriority.pathToDate
            sliderLabel.text = pathDayTimePriority.dayTimePriority
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddPriorityMode = presentingViewController is UINavigationController
        
        if isPresentingInAddPriorityMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The ViewController is not inside a navigation controller.")
        }
    }
    
    // This method lets you configure a view controller before it's presented.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let dayTimePriority = sliderLabel.text ?? ""
        let pathFromDate = fromDateText.text ?? ""
        let pathToDate = toDateText.text ?? ""
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        pathDayTimePriority = PathDayTimePriority(dayTimePriority: dayTimePriority, pathToDate: pathToDate, pathFromDate: pathFromDate)
    }
    
    //MARK: Actions
    @IBAction func fromDateAction(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.string(from: fromDatePicker.date)
        self.fromDateText.text = strDate
    }
    
    @IBAction func toDateAction(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.string(from: toDatePicker.date)
        self.toDateText.text = strDate
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        sliderLabel.text = "\(currentValue)"
    }
    
    
}
