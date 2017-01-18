//
//  RoadPriorityTableViewCell.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/12/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit

class RoadPriorityTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var fromDateLabel: UILabel!
    @IBOutlet weak var toDateLabel: UILabel!
    //@IBOutlet weak var valueLabel: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
