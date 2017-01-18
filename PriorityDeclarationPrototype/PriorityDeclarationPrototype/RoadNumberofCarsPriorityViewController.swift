//
//  RoadNumberofCarsPriorityViewController.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/12/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit
import os.log

class RoadNumberofCarsPriorityViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var minNumberLabel: UILabel!
    @IBOutlet weak var minNumberText: UITextField!
    @IBOutlet weak var maxNumberLabel: UILabel!
    @IBOutlet weak var maxNumberText: UITextField!
    
    @IBOutlet weak var priorityValueLabel: UILabel!
    @IBOutlet weak var sliderBar: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //
    
    var roadNumberOfCarsPriority: RoadNumberCarsPriority?
    
    var activeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        minNumberText.delegate = self
        maxNumberText.delegate = self
        
        // Set up views if editing an existing priority.
        if let roadNumberOfCarsPriority = roadNumberOfCarsPriority {
            navigationItem.title = ""
            minNumberText.text = roadNumberOfCarsPriority.minNumber
            maxNumberText.text = roadNumberOfCarsPriority.maxNumber
            sliderLabel.text = roadNumberOfCarsPriority.numberPriority
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
        
        let minNumber = minNumberText.text ?? ""
        let maxNumber = maxNumberText.text ?? ""
        let numberPriority = sliderLabel.text ?? ""
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        roadNumberOfCarsPriority = RoadNumberCarsPriority(minNumber: minNumber, maxNumber: maxNumber, numberPriority: numberPriority)
    }
    
    //MARK: Actions
    @IBAction func sliderBarChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        sliderLabel.text = "\(currentValue)"
    }

    
}
