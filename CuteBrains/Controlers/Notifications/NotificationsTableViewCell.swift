//
//  NotificationsTableViewCell.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/7/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {

    @IBOutlet weak var initiator: UILabel!
    
    
    @IBOutlet weak var content: UILabel!
    
    @IBOutlet weak var createdAt: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
