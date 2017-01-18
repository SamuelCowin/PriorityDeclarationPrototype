//
//  PathDayTimePriorityTableViewCell.swift
//  PriorityDeclarationPrototype
//
//  Created by Samuel Cowin on 1/14/17.
//  Copyright © 2017 Shepard. All rights reserved.
//

import UIKit

class PathDayTimePriorityTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var pathFromLabel: UILabel!
    @IBOutlet weak var pathToLabel: UILabel!
    @IBOutlet weak var pathDayTimePriorityLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
