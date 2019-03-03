//
//  LeaveTypeTableViewCell.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/28/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

class LeaveTypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var LeaveType: UILabel!
    
    @IBOutlet weak var LeaveTaken: UILabel!
    
    @IBOutlet weak var TotalLeaves: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
