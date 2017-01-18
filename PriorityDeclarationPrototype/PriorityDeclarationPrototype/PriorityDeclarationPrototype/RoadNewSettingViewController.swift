//
//  RoadNewSettingViewController.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/12/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit
import os.log

class RoadNewSettingViewController: UIViewController {
    
    //MARK: Properties
    //@IBOutlet weak var roadValueSlider: UISlider!
    //@IBOutlet weak var roadLabelValue: UILabel!
    @IBOutlet weak var fromDatePicker: UIDatePicker!
    @IBOutlet weak var fromDateSelection: UILabel!
    @IBOutlet weak var toDatePicker: UIDatePicker!
    @IBOutlet weak var toDateSelection: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
     This value is either passed by `RoadPriorityTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var priority: RoadPriority?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation

    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let toDateText = toDateSelection.text ?? ""
        let fromDateText = fromDateSelection.text ?? ""
       // let value = Int(roadLabelValue.text ?? "")
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        priority = RoadPriority(fromDate: fromDateText, toDate: toDateText/*, priorityValue: value!*/)
    }

    
    //MARK: Actions
    @IBAction func toDatePickerAction(_ sender: UIDatePicker) {
        var dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd-MM-yyyy HH:mm"
        var strDate1 = dateFormatter1.string(from: toDatePicker.date)
        self.toDateSelection.text = strDate1
    }
    
    @IBAction func fromDatePickerAction(_ sender: UIDatePicker) {
        var dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "dd-MM-yyyy HH:mm"
        var strDate2 = dateFormatter2.string(from: fromDatePicker.date)
        self.fromDateSelection.text = strDate2
    }
    
    //@IBAction func roadSliderValueChanged(_ sender: UISlider) {
        //var currentValue = Int(sender.value)
        
        //roadLabelValue.text = "\(currentValue)"
    //}
    
    
}

