//
//  News.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/4/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation

class News
{
    var nameUser: String!
    var titleNews: String!
    var dateCreationNews: String!
    var descriptionNews: String!
    
    init(nameUser: String, titleNews: String, dateCreationNews: String, descriptionNews: String) {
        self.nameUser = nameUser
        self.titleNews = titleNews
        self.dateCreationNews = dateCreationNews
        self.descriptionNews = descriptionNews
    }
    
}
