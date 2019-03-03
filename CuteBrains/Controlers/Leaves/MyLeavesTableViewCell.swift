//
//  MyLeavesTableViewCell.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/28/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

class MyLeavesTableViewCell: UITableViewCell {

    @IBOutlet weak var StartDate: UILabel!
    
    @IBOutlet weak var ForDays: UILabel!
    
    @IBOutlet weak var reason: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
