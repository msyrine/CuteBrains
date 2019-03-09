//
//  TimeTable.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/26/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation

class TimeTable
{
    var weekDayID: String!
    var subject: String!
    var classSubject: String!
    var startTime: String!
    var endTime: String!
    var isBreak: String!
    
    init(weekDayID: String, subject: String, classSubject: String, startTime: String, endTime: String, isBreak: String) {
        self.subject = subject
        self.classSubject = classSubject
        self.startTime = startTime
        self.isBreak = isBreak
        self.endTime = endTime
        self.weekDayID = weekDayID
    }
    
    init(weekDayID: String, subject: String, startTime: String, endTime: String, isBreak: String) {
        self.subject = subject
        self.startTime = startTime
        self.isBreak = isBreak
        self.endTime = endTime
        self.weekDayID = weekDayID
    }
}
