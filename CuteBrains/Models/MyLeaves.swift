//
//  MyLeaves.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/28/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation

class MyLeaves
{
    var days: String!
    var start_date: String!
    var reason: String!
    var is_half_day: String!
    
    init(days: String, start_date: String, reason: String, is_half_day: String) {
        self.days = days
        self.start_date = start_date
        self.reason = reason
        self.is_half_day = is_half_day
    }
}
