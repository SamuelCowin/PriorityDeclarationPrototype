//
//  RoadPriority.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/12/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit

class RoadPriority {
    
    //MARK: Properties
    
    var fromDate: String
    var toDate: String
    //var priorityValue: Int
    
    //MARK: Initialization
    init?(fromDate: String, toDate: String/*, priorityValue: Int*/) {
        
        // The date must not be empty
        guard !toDate.isEmpty else {
            return nil
        }
        
        // The date must not be empty
        guard !fromDate.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.fromDate = fromDate
        self.toDate = toDate
        self.priorityValue = priorityValue
    }
    
}
