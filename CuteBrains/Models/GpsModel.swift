//
//  GpsModel.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/6/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation

class GpsModel
{
    var Status: String!
    var Datetime: String!
    var Vehicle_No: String!
    var Vehicletype: String!
    var wPower: String!
    var GPS: String!
    var CurrentLocation: String!
    var POI: String!
    var lattitude: String!
    var longitude: String!
    var speed: String!
    var lat: Double
    var lg: Double
    
    init(status: String, datetime: String, vehicule_no: String, vehicule_type: String, wpower: String, gps: String, currentLocation: String, poi: String, lat: String, lg: String, speed: String) {
        self.Status = status
        self.Datetime = datetime
        self.Vehicle_No = vehicule_no
        self.Vehicletype = vehicule_type
        self.wPower = wpower
        self.GPS = gps
        self.CurrentLocation = currentLocation
        self.POI = poi
        self.lattitude = lat
        self.longitude = lg
        self.speed = speed
        self.lat = Double(lat)!
        self.lg = Double(lg)!
    }
    
    
}
