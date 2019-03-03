//
//  LeaveType.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/28/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation

class LeaveType
{
    var nameLeave: String!
    var leave_count: String!
    var leave_taken: String!
    var is_additional: String!
    var available_leavess: String!
    var sum_leave_count: String!
    var sum_leave_taken: String!
    
    init(nameLeave: String, leave_count: String, leave_taken: String, is_additional: String, available_leavess: String, sum_leave_count: String, sum_leave_taken: String ) {
        
       
        self.nameLeave = nameLeave
        self.leave_count = leave_count
        self.leave_taken = leave_taken
        self.is_additional = is_additional
        self.available_leavess = available_leavess
        self.sum_leave_count = sum_leave_count
        self.sum_leave_taken = sum_leave_taken
    }
}
