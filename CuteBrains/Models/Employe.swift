//
//  Employe.swift
//  CuteBrains
//
//  Created by sayednasri on 29/01/2019.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation
import AlamofireXmlToObjects

class Employe : EVObject
{
    var employee_name: String!
    var joining_date: String!
    var employee_department: String!
    var employee_categorie: String!
    var employee_position: String!
    var employee_grade: String!
    var job_title: String!
    var reporting_manager: String!
    var gender: String!
    var email: String!
    var status: String!
    var qualification: String!
    var total_experiance: String!
    var experiance_info: String!
    var date_of_birth: String!
    var marital_status: String!
    var children_count: String!
    var father_name: String!
    var mother_name: String!
    var spouse_name: String!
    var blood_group: String!
    var nationality: String!
    var biometric_id: String!
    var home_address: String!
    var city: String!
    var state: String!
    var country: String!
    var pin_code: String!
    var office_address: String!
    var office_city: String!
    var office_country: String!
    var office_pin_code: String!
    var office_phone1: String!
    var office_phone2: String!
    var mobile: String!
    var home_phone: String!
    var fax: String!
    var photo: String!
    var employee_additional_details: employee_additional_details!
    var employee_bank_details: employee_bank_details = [employee_bank_details]()
    var office_phone2: String!
    var mobile: String!
    var home_phone: String!
    var fax: String!
    
    init(accesToken: String, type: String, email: String, userName: String, fullName: String, refreshToken: String, expiresIn: Int) {
        self.accessToken = accesToken
        self.type = type
        self.email = email
        self.userName = userName
        self.fullName = fullName
        self.refreshToken = refreshToken
        self.expiresIn = expiresIn
}
}
class employee_additional_details : EVObject
{
    var name: String!
    var value: String!
  
   
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
        
    }
}

class employee_bank_details : EVObject
{
    var name: String!
    var value: String!
    
    
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
        
    }
}
