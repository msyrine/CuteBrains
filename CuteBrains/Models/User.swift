//
//  User.swift
//  CuteBrains
//
//  Created by sayednasri on 24/01/2019.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation
 class User
{
    var accessToken: String!
    var type: String!
    var email: String!
    var userName: String!
    var fullName: String!
    var refreshToken: String!
    var expiresIn: Int!
    var isEmployee: Bool!
    
    init(accesToken: String, type: String, email: String, userName: String, fullName: String, refreshToken: String, expiresIn: Int) {
        self.accessToken = accesToken
        self.type = type
        self.email = email
        self.userName = userName
        self.fullName = fullName
        self.refreshToken = refreshToken
        self.expiresIn = expiresIn
        if(type == "Employee")
        {
            self.isEmployee = true
        }
        else{
            self.isEmployee = false
        }
    }
    
    
}
