//
//  RoadNumberCarsPriority.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/13/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit

class RoadNumberCarsPriority {
    
    //MARK: Properties
    
    var minNumber: String
    var maxNumber: String
    var numberPriority: String
    
    //MARK: Initialization
    
    init?(minNumber: String, maxNumber: String, numberPriority: String) {
        
        // The minTime must not be empty
        guard !minNumber.isEmpty else {
            return nil
        }
        
        // The maxTime must not be empty
        guard !maxNumber.isEmpty else {
            return nil
        }
        
        // The timePriority must not be empty
        guard !numberPriority.isEmpty else {
            return nil
        }
        
        //Initialize stored properties
        self.minNumber = minNumber
        self.maxNumber = maxNumber
        self.numberPriority = numberPriority
        
    }
    
}

