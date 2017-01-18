//
//  PathDayTimePriority.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/13/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit

class PathDayTimePriority {
    
    //MARK: Properties
    
    var dayTimePriority: String
    var pathToDate: String
    var pathFromDate: String
    
    //MARK: Initialization
    
    init?(dayTimePriority: String, pathToDate: String, pathFromDate: String) {
        
        // The minTime must not be empty
        guard !dayTimePriority.isEmpty else {
            return nil
        }
        
        // The maxTime must not be empty
        guard !pathToDate.isEmpty else {
            return nil
        }
        
        // The timePriority must not be empty
        guard !pathFromDate.isEmpty else {
            return nil
        }
        
        //Initialize stored properties
        self.dayTimePriority = dayTimePriority
        self.pathToDate = pathToDate
        self.pathFromDate = pathFromDate
        
    }
    
}
