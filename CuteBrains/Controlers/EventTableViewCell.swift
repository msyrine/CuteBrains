//
//  EventTableViewCell.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/2/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var labelGaucheHaut: UILabel!
    
    @IBOutlet weak var labelGaucheBas: UILabel!
    
    @IBOutlet weak var labelDroitHaut: UILabel!
    
    @IBOutlet weak var labelDroitBas: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
