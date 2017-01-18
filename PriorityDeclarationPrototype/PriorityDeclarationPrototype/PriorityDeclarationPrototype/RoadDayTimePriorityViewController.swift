//
//  RoadDayTimePriorityViewController.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/12/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit
import os.log

class RoadDayTimePriorityViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var priorityValueLabel: UILabel!
    @IBOutlet weak var sliderBar: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var fromDateText: UILabel!
    @IBOutlet weak var fromDatePicker: UIDatePicker!
    
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var toDateText: UILabel!
    @IBOutlet weak var toDatePicker: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //
    
    var roadDTPriority: RoadDayTimePriority?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set up views if editing an existing priority.
        if let roadDTPriority = roadDTPriority {
            navigationItem.title = ""
            fromDateText.text = roadDTPriority.roadFromDate
            toDateText.text = roadDTPriority.roadToDate
            sliderLabel.text = roadDTPriority.roadDayTimePriority
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
        
        let roadDayTimePriority = sliderLabel.text ?? ""
        let roadToDate = toDateText.text ?? ""
        let roadFromDate = fromDateText.text ?? ""
        
        // Set the meal to be passed to TableViewController after the unwind segue.
        roadDTPriority = RoadDayTimePriority(roadDayTimePriority: roadDayTimePriority, roadToDate: roadToDate, roadFromDate: roadFromDate)
    }
    
    //MARK: Actions
    @IBAction func sliderBarChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        sliderLabel.text = "\(currentValue)"
    }
    
    @IBAction func fromPickerAction(_ sender: UIDatePicker) {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd-MM-yyy HH:mm"
        let strDate1 = dateFormatter1.string(from: fromDatePicker.date)
        self.fromDateText.text = strDate1
    }
    
    @IBAction func toPickerAction(_ sender: UIDatePicker) {
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate2 = dateFormatter2.string(from: toDatePicker.date)
        self.toDateText.text = strDate2
    }
    
    
}
