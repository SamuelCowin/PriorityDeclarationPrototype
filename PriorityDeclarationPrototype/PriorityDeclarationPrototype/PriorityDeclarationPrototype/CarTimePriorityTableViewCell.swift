//
//  CarTimePriorityTableViewCell.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/13/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit

class CarTimePriorityTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var carToLabel: UILabel!
    @IBOutlet weak var carFromLabel: UILabel!
    @IBOutlet weak var timePriorityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
