//
//  CarTimePriority.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/13/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit

class CarTimePriority {
    
    //MARK: Properties
    
    var minTime: String
    var maxTime: String
    var timePriority: String
    
    //MARK: Initialization
    
    init?(minTime: String, maxTime: String, timePriority: String) {
        
        // The minTime must not be empty
        guard !minTime.isEmpty else {
            return nil
        }
        
        // The maxTime must not be empty
        guard !maxTime.isEmpty else {
            return nil
        }
        
        // The timePriority must not be empty
        guard !timePriority.isEmpty else {
            return nil
        }
        
        //Initialize stored properties
        self.minTime = minTime
        self.maxTime = maxTime
        self.timePriority = timePriority
        
    }

}

