//
//  PriorityDeclarationPrototypeTests.swift
//  PriorityDeclarationPrototypeTests
//
//  Created by Samuel Cowin on 1/6/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import XCTest
@testable import PriorityDeclarationPrototype

class PriorityDeclarationPrototypeTests: XCTestCase {
    
    //MARK: Priority Class Tests
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testPriorityInitializationSucceeds() {
        // Zero rating
        let zeroRatingPriority = RoadPriority.init(fromDate: "Zero", toDate: "hello", priorityValue: 0)
        XCTAssertNotNil(zeroRatingPriority)
        
        // Highest positive rating
        let positiveRatingPriority = RoadPriority.init(fromDate: "Positive", toDate: "hskdfvnod", priorityValue: 100)
        XCTAssertNotNil(positiveRatingPriority)
    }
    
    // Confirm that the Meal initialier returns nil when passed a negative rating or an empty name.
    func testPriorityInitializationFails() {
    
        // Empty String
        let emptyStringPriority = RoadPriority.init(fromDate: "", toDate: "", priorityValue: 0)
        XCTAssertNil(emptyStringPriority)
    }
    
}
