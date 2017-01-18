//
//  RoadDayTimePriority.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/13/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit

class RoadDayTimePriority {
    
    //MARK: Properties
    
    var roadDayTimePriority: String
    var roadToDate: String
    var roadFromDate: String
    
    //MARK: Initialization
    
    init?(roadDayTimePriority: String, roadToDate: String, roadFromDate: String) {
        
        // The minTime must not be empty
        guard !roadDayTimePriority.isEmpty else {
            return nil
        }
        
        // The maxTime must not be empty
        guard !roadToDate.isEmpty else {
            return nil
        }
        
        // The timePriority must not be empty
        guard !roadFromDate.isEmpty else {
            return nil
        }
        
        //Initialize stored properties
        self.roadDayTimePriority = roadDayTimePriority
        self.roadToDate = roadToDate
        self.roadFromDate = roadFromDate
        
    }
    
}

