//
//  Subjects.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/5/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation

class Subjects {
    var name: String!
    var code: String!
    var max_weekly_classes: String!
    var first_name: String!
    
    init(name: String, code: String, max_weekly_classes: String, first_name: String) {
        self.name = name
        self.code = code
        self.max_weekly_classes = max_weekly_classes
        self.first_name = first_name
    }
}
