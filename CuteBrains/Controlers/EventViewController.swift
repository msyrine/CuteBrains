//
//  EventViewController.swift
//  CuteBrains
//
//  Created by sayednasri on 20/01/2019.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire

class EventViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
   

    
    @IBOutlet weak var NoData: UILabel!
    var events = [Event]()
    var urlEvent = ""
    var eventsHoliday = [Event]()
    var eventsFees = [Event]()
    var eventsExams = [Event]()
    var typeTableau: Int!
    var head = [String]()
    var headTrie = [String]()
    var numberInSection = [Int]()
    
    @IBOutlet weak var tableViewEvent: UITableView!
    
    @IBOutlet weak var eventType: UISegmentedControl!
    
    
    @IBAction func indexChanged(_ sender: Any) {
        switch eventType.selectedSegmentIndex
        {
        case 0:
            typeTableau = 0
        case 1:
            typeTableau = 1
        case 2:
            typeTableau = 2
        case 3:
            typeTableau = 3
        default:
            typeTableau = 0
        }
        tableViewEvent.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(!AppDelegate.currentUser.isEmployee)
        {
            urlEvent = "http://156.67.221.128:60/cute%20brains/events.php"
        }
        else
        {
            urlEvent = "http://156.67.221.128:60/cute%20brains/events_employee.php"
        }
        
        
         let headers:  HTTPHeaders = [
         "Content-Type": "application/x-www-form-urlencoded",
         ]
        
        let parametres = [
            "admission_num": AppDelegate.currentUser.accessToken
        ]
        
        Alamofire.request(urlEvent, method: .post, parameters: parametres, encoding: URLEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    
                    print(error)
                    print("erreeeuuur ")
                case .success(let value):
        
                     let json = value as? NSArray
                   for  v in (json as! NSArray)
                   {
                    let event = v as! Dictionary<String,AnyObject>
                    let nameEvent = event["title"]! as! String
                    let date = event["start_date"]! as! String
                    let dateFin = event["end_date"]! as! String
                    let idEvent = event["id"]! as! String
                    let isHoliday = event["is_holiday"]! as! String
                    let isExam = event["is_exam"]! as! String
                    let isFees = event["is_due"]! as! String
                    let dateformatter = DateFormatter()
                    dateformatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
                    guard let d = dateformatter.date(from: date) else {
                        fatalError("ERROR: Date conversion failed due to mismatched format.")
                    }
                    
                    let dateformatter2 = DateFormatter()
                    dateformatter2.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
                    guard let d2 = dateformatter2.date(from: dateFin) else {
                        fatalError("ERROR: Date conversion failed due to mismatched format.")
                    }
                    let calendar = Calendar.current
                    let year = calendar.component(.year, from: d)
                    let month = calendar.component(.month, from: d)
                    let day = calendar.component(.day, from: d)
                    let weekday = Calendar.current.component(.weekday, from: d)
                    let hour = Calendar.current.component(.hour, from: d)
                    let min = Calendar.current.component(.minute, from: d)
                    let hourFin = Calendar.current.component(.hour, from: d2)
                    let minFin = Calendar.current.component(.minute, from: d2)
                  //  print(day,month,year,weekday,hour,min,hourFin,minFin)
                    self.head.append(String(month)+"."+String(year))
                    var dayname = ""
                    switch weekday{
                    case 1:
                        dayname = "Sun"
                    case 2 :
                        dayname = "Mon"
                    case 3 :
                        dayname = "Tue"
                    case 4 :
                        dayname = "Wed"
                    case 5 :
                        dayname = "Thur"
                    case 6 :
                        dayname = "Fri"
                    default:
                        dayname = "Sat"
                    }
                    if(isHoliday == "1")
                    { let eventObj = Event(eventId: idEvent, stringDate: date, stringDateFin: dateFin, nameOfEvent: nameEvent, typeEvent: "holiday", heureDebutEvent: hour, dayOfWeek: dayname, dayOfMounth: day, month: month, year: year, minuteDebut: min, minuteFin: minFin, HeureFin: hourFin)
                        self.events.append(eventObj)
                        self.eventsHoliday.append(eventObj)
                    }
                   else if(isFees == "1")
                    { let eventObj = Event(eventId: idEvent, stringDate: date, stringDateFin: dateFin, nameOfEvent: nameEvent, typeEvent: "fees", heureDebutEvent: hour, dayOfWeek: dayname, dayOfMounth: day, month: month, year: year, minuteDebut: min, minuteFin: minFin, HeureFin: hourFin)
                        self.events.append(eventObj)
                        self.eventsFees.append(eventObj)
                    }else if(isExam == "1")
                    { let eventObj = Event(eventId: idEvent, stringDate: date, stringDateFin: dateFin, nameOfEvent: nameEvent, typeEvent: "exam", heureDebutEvent: hour, dayOfWeek: dayname, dayOfMounth: day, month: month, year: year, minuteDebut: min, minuteFin: minFin, HeureFin: hourFin)
                        self.events.append(eventObj)
                        self.eventsExams.append(eventObj)
                    }else{
                        let eventObj = Event(eventId: idEvent, stringDate: date, stringDateFin: dateFin, nameOfEvent: nameEvent, typeEvent: "all", heureDebutEvent: hour, dayOfWeek: dayname, dayOfMounth: day, month: month, year: year, minuteDebut: min, minuteFin: minFin, HeureFin: hourFin)
                        self.events.append(eventObj)
                    }
                 }
              
//                     for s in self.head
//                     {
//                        if !self.headTrie.contains(s)
//                        {
//                            self.headTrie.append(s)
//                        }
//                     }
//                    for s in self.headTrie
//                    {
//                        print(s)
//                     }
//
             
                   
              
                   
                    
                           self.tableViewEvent.reloadData()
                }
              
                
//                for s in self.head
//
//                {
//                    if !self.headTrie.contains(s)
//                    {
//                        self.headTrie.append(s)
//                        print(s)
//                    }
//                }
//                for u in self.headTrie
//                {
//                    print(u)
//                }
                
        }
        
        
    }
    
 
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var fahmi: Int = 0
        switch typeTableau {
        case 0:
            
            for s in events
            {
                let f = s.month + "." + s.year
                if( f == self.headTrie[section])
                {
                    fahmi += 1
                }
            }
          //fahmi = events.count
        case 1:
            for s in eventsFees
            {
                let f = s.month + "." + s.year
                if( f == self.headTrie[section])
                {
                    fahmi += 1
                }
            }
           // fahmi = eventsFees.count
        case 2:
            for s in eventsExams
            {
                let f = s.month + "." + s.year
                if( f == self.headTrie[section])
                {
                    fahmi += 1
                }
            }
           // fahmi = eventsExams.count
        case 3:
            for s in eventsHoliday
            {
                let f = s.month + "." + s.year
                if( f == self.headTrie[section])
                {
                    fahmi += 1
                }
            }
           // fahmi = eventsHoliday.count
        default:
            for s in events
            {
                let f = s.month + "." + s.year
                if( f == self.headTrie[section])
                {
                    fahmi += 1
                }
            }
           // fahmi = events.count
            
        }
        if (fahmi != 0)
        {
            self.tableViewEvent.isHidden = false
            self.NoData.isHidden = true
            
        }
        else{
            self.tableViewEvent.isHidden = true
            self.NoData.isHidden = false
            
        }
        return fahmi
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
                        for s in self.head
        
                        {
                            if !self.headTrie.contains(s)
                            {
                                self.headTrie.append(s)
                                
                                
                            }
                        }
        
        return self.headTrie.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
   
       
            let index = self.headTrie[section].index(of: ".")!
            let newStr = self.headTrie[section][..<index]
        var afterStr = self.headTrie[section][index...]
        afterStr.removeFirst()
        //print (afterStr)
        switch newStr {
        case "1":
            return "January"+afterStr
        case "2":
            return "February"+afterStr
        case "3":
            return "March"+afterStr
        case "4":
            return "April"+afterStr
        case "5":
            return "May"+afterStr
        case "6":
            return "June"+afterStr
        case "7":
            return "July"+afterStr
        case "8":
            return "August"+afterStr
        case "9":
            return "September"+afterStr
        case "10":
            return "October"+afterStr
        case "11":
            return "November"+afterStr

        default:
            return "December"+afterStr
        }

        
      
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellEvent") as! EventTableViewCell
        // print("cell")
        //  print(events[indexPath.row].nameOfEvent)
        
        switch typeTableau {
        case 0:
            if(events.count != 0)
            {
                //print(indexPath.row)
                tableViewEvent.isHidden = false
                self.NoData.isHidden = true
                
                   let str = events[indexPath.row].month+"."+events[indexPath.row].year
              /*  print("/*******/")
                print(str)
                print(indexPath)
                print(self.headTrie[indexPath.section])*/
                
                if(str == self.headTrie[indexPath.section])
                {
                        cell.labelDroitHaut.text = events[indexPath.row].nameOfEvent
                        cell.labelGaucheHaut.text = events[indexPath.row].dfm
                        cell.labelGaucheBas.text = events[indexPath.row].dayOfWeek
                        cell.labelDroitBas.text = events[indexPath.row].hour
                }
               
               
            }
            else{
                tableViewEvent.isHidden = true
                self.NoData.isHidden = false
                
            }
        case 1:
            if(eventsFees.count != 0)
            {
                tableViewEvent.isHidden = false
                self.NoData.isHidden = true
                   let str = events[indexPath.row].month+"."+events[indexPath.row].year
                if(str == self.headTrie[indexPath.section])
                {
                cell.labelDroitHaut.text = eventsFees[indexPath.row].nameOfEvent
                cell.labelGaucheHaut.text = eventsFees[indexPath.row].dfm
                cell.labelGaucheBas.text = eventsFees[indexPath.row].dayOfWeek
                cell.labelDroitBas.text = eventsFees[indexPath.row].hour
                }
            }
            else{
                tableViewEvent.isHidden = true
                self.NoData.isHidden = false
            }
        case 2:
            if(eventsExams.count != 0)
            {
                tableViewEvent.isHidden = false
                self.NoData.isHidden = true
                   let str = events[indexPath.row].month+"."+events[indexPath.row].year
                if(str == self.headTrie[indexPath.section])
                {
                cell.labelDroitHaut.text = eventsExams[indexPath.row].nameOfEvent
                cell.labelGaucheHaut.text = eventsExams[indexPath.row].dfm
                cell.labelGaucheBas.text = eventsExams[indexPath.row].dayOfWeek
                cell.labelDroitBas.text = eventsExams[indexPath.row].hour
                }
            }else{
                tableViewEvent.isHidden = true
                self.NoData.isHidden = false
            }
            
        case 3:
            if(eventsHoliday.count != 0)
            {
                // print("holiday")
                // print(indexPath.row)
                tableViewEvent.isHidden = false
                self.NoData.isHidden = true
                   let str = events[indexPath.row].month+"."+events[indexPath.row].year
                if(str == self.headTrie[indexPath.section])
                {
                cell.labelDroitHaut.text = eventsHoliday[indexPath.row].nameOfEvent
                cell.labelGaucheHaut.text = eventsHoliday[indexPath.row].dfm
                cell.labelGaucheBas.text = eventsHoliday[indexPath.row].dayOfWeek
                cell.labelDroitBas.text = eventsHoliday[indexPath.row].hour
                }
            }else{
                tableViewEvent.isHidden = true
                self.NoData.isHidden = false
            }
        default:
            if(events.count != 0)
            {
                tableViewEvent.isHidden = false
                self.NoData.isHidden = true
                   let str = events[indexPath.row].month+"."+events[indexPath.row].year
                if(str == self.headTrie[indexPath.section])
                {
                cell.labelDroitHaut.text = events[indexPath.row].nameOfEvent
                cell.labelGaucheHaut.text = events[indexPath.row].dfm
                cell.labelGaucheBas.text = events[indexPath.row].dayOfWeek
                cell.labelDroitBas.text = events[indexPath.row].hour
                }
            }else{
                tableViewEvent.isHidden = true
                self.NoData.isHidden = false
            }
        }
        
        
        return cell
    }
   
    
    
    
}

