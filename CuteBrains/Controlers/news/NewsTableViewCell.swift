//
//  NewsTableViewCell.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/4/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageUser: UIImageView!
    
    @IBOutlet weak var nameUser: UILabel!
    
    @IBOutlet weak var titleNews: UILabel!
    
    @IBOutlet weak var dateCreationNews: UILabel!
    
    @IBOutlet weak var descriptionNews: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
