//
//  RoadNumberofCarsPriorityTableViewCell.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/14/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit

class RoadNumberofCarsPriorityTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var minCarsLabel: UILabel!
    @IBOutlet weak var maxCarsLabel: UILabel!
    @IBOutlet weak var roadNumberPriorityValue: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
