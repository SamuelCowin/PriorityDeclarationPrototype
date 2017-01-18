//
//  CarTimePriorityViewController.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/12/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit
import os.log

class CarTimePriorityViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties

    @IBOutlet weak var MaxTimeLabel: UILabel!
    @IBOutlet weak var minTimeLabel: UILabel!
    @IBOutlet weak var priorityValueLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var minTextField: UITextField!
    @IBOutlet weak var maxTextField: UITextField!
    @IBOutlet weak var sliderBar: UISlider!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    //
    var carTimePriority: CarTimePriority?
    
    var activeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        minTextField.delegate = self
        maxTextField.delegate = self
        
        // Set up views if editing an existing priority.
        if let carTimePriority = carTimePriority {
            navigationItem.title = ""
            minTextField.text = carTimePriority.minTime
            maxTextField.text = carTimePriority.maxTime
            sliderLabel.text = carTimePriority.timePriority
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField.text = textField.text
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
        
        let minTime = minTextField.text ?? ""
        let maxTime = maxTextField.text ?? ""
        let timePriority = sliderLabel.text ?? ""
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        carTimePriority = CarTimePriority(minTime: minTime, maxTime: maxTime, timePriority: timePriority)
    }
    
    
    //MARK: Actions
    @IBAction func sliderBarChange(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        sliderLabel.text = "\(currentValue)"
    }
    
    
    
}
