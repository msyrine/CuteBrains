//
//  Event.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/2/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation
class Event
{
    var eventId: String!
    var stringDate: String
    var stringDateFin: String
    var dayOfMounth: Int!
    var dayOfWeek: String!
    var month: String!
    var year: String!
    var nameOfEvent: String!
    var heureDebutEvent : String!
    var minuteDebut: String!
    var minuteFin: String!
    var HeureFin: String!
    var typeEvent: String!
    var dfm: String!
    var hour: String = ""
    
    init(eventId: String, stringDate: String, stringDateFin: String, nameOfEvent: String, typeEvent: String, heureDebutEvent: Int, dayOfWeek: String, dayOfMounth: Int, month: Int, year: Int, minuteDebut: Int, minuteFin: Int, HeureFin: Int)
    {
        self.eventId = eventId
        
        self.dayOfWeek = dayOfWeek
        self.month = String(month)
        self.year = String(year)
        self.nameOfEvent = nameOfEvent
        self.stringDate = stringDate
        self.heureDebutEvent = String(heureDebutEvent)
        self.minuteDebut = String(minuteDebut)
        self.minuteFin = String(minuteFin)
        self.HeureFin = String(HeureFin)
        self.typeEvent = typeEvent
        self.stringDateFin = stringDateFin
        self.dayOfMounth = dayOfMounth
        if(dayOfMounth<10)
        {
            dfm = "0" + String(dayOfMounth)
        }
        else{
            dfm = String(dayOfMounth)
        }
       
        self.hour = self.heureDebutEvent
        self.hour += ":"
        self.hour += self.minuteDebut
        self.hour += " - "
        self.hour += self.HeureFin
        self.hour += ":"
        self.hour += self.minuteFin
       // print(hour)
    }
    
 
}
