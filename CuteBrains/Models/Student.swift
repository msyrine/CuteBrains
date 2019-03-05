//
//  Student.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/5/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation

class Student
{
    var id: String!
    var name: String!
    var g_name: String!
    var g_phone: String!
    var gender: String!
    var language: String!
    var date_of_birth: String!
    var admission_no: String!
    var roll_number: String!
    var is_absent: String!
    
    init(id: String, name: String, g_name: String, g_phone: String, gender: String, language: String, date_of_birth: String, admission_no: String, roll_number: String, is_absent: String) {
        
        self.id = id
        self.name = name
        self.g_name = g_name
        self.g_phone = g_phone
        self.gender = gender
        self.language = language
        self.date_of_birth = date_of_birth
        self.admission_no = admission_no
        self.roll_number = roll_number
        self.is_absent = is_absent
    }
}
