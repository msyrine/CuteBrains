//
//  Notifications.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/7/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation
class Notifications
{
    var content: String!
    var initiator: String!
    var created_at: String!
    var is_read: String!
    var type: String!
    
    init(content: String, initiator: String, created_at: String, is_read: String, type: String) {
        self.content = content
        self.initiator = initiator
        self.created_at = created_at
        self.is_read = is_read
        self.type = type
    }
}
