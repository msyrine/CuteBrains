//
//  TimeTableViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/26/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire

class TimeTableViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    var batchId = ""
    
    @IBOutlet weak var collectionViewTimeTable: UICollectionView!
    @IBOutlet weak var tableviewTimeTable: UITableView!
    
    let daysOfWeek = ["MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY"]
    
    var timeTableInfo = [TimeTable]()
    
    
    
    var timeTableInfoTrie = [TimeTable]()
    var url: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print ("view did load")
        if(batchId == "")
        {
            self.url = "http://68.183.81.236:60/dev/cute%20brains/timetable_employee.php"
        }
        else
        {
           self.url = "http://68.183.81.236:60/dev/cute%20brains/timetable_employee_batch.php"
        }
        
        let headers:  HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            ]
        
        var parametres = Dictionary<String,AnyObject>()
        
        if(batchId == "")
        {
            parametres = [
                "admission_num": "T010"
                ] as [String : AnyObject]
        }
        else
        {
            parametres = [
                "admission_num": "T010",
                "batch_id": batchId
                ] as [String : AnyObject]
        }
      
        
        Alamofire.request(url, method: .post, parameters: parametres as Parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    
                    print(error)
                    print("erreeeuuur ")
                case .success(let value):
                    print(value)
                    let json = value as? NSArray
                    print(json)
                    for  v in (json as! NSArray)
                    {

                        let new = v as! Dictionary<String,AnyObject>
                        let weekday_id = new["weekday_id"]! as! String
                        let name = new["name"]! as! String
                        let is_break = new["is_break"]! as! String
                        let start_time = new["start_time"]! as! String
                        let end_time = new["end_time"]! as! String
                        var cname: String
                        if(self.batchId == "")
                        {
                            cname = new["cname"]! as! String
                            let n = TimeTable(weekDayID: weekday_id, subject: name, classSubject: cname, startTime: start_time, endTime: end_time, isBreak: is_break)
                               self.timeTableInfo.append(n)
                            
                        }
                      else
                        {
                             let n = TimeTable(weekDayID: weekday_id, subject: name, startTime: start_time, endTime: end_time, isBreak: is_break)
                               self.timeTableInfo.append(n)
                        }

                      

                     

                    }
                    
                    for s in self.timeTableInfo
                    {
                        if(s.weekDayID == "1")
                        {
                            self.timeTableInfoTrie.append(s)
                        }
                    }



                   self.tableviewTimeTable.reloadData()
                }
                
                
        }
        
        
        
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysOfWeek.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewTimeTable.dequeueReusableCell(withReuseIdentifier: "collectionViewTimeTable", for: indexPath) as! TimeTableCollectionViewCell
        cell.dayOfWeek.text = daysOfWeek[indexPath.row]
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.timeTableInfoTrie.removeAll()
            for s in self.timeTableInfo
            {
                if(s.weekDayID == "1")
                {
                    
                    self.timeTableInfoTrie.append(s)
                }
            }
            print(timeTableInfoTrie.count)
            
        case 1:
            self.timeTableInfoTrie.removeAll()
            for s in self.timeTableInfo
            {
                if(s.weekDayID == "2")
                {
                   
                    self.timeTableInfoTrie.append(s)
                }
            }
            print(timeTableInfoTrie.count)
        case 2:
            self.timeTableInfoTrie.removeAll()
            for s in self.timeTableInfo
            {
                if(s.weekDayID == "3")
                {
                    self.timeTableInfoTrie.append(s)
                }
            }
            print(timeTableInfoTrie.count)
        case 3:
            self.timeTableInfoTrie.removeAll()
            for s in self.timeTableInfo
            {
                if(s.weekDayID == "4")
                {
                    self.timeTableInfoTrie.append(s)
                }
            }
           print(timeTableInfoTrie.count)
        case 4:
            self.timeTableInfoTrie.removeAll()
            for s in self.timeTableInfo
            {
                if(s.weekDayID == "5")
                {
                    self.timeTableInfoTrie.append(s)
                }
            }
         print(timeTableInfoTrie.count)
        case 5:
            self.timeTableInfoTrie.removeAll()
            for s in self.timeTableInfo
            {
                if(s.weekDayID == "6")
                {
                    self.timeTableInfoTrie.append(s)
                }
            }
           print(timeTableInfoTrie.count)
        default:
            self.timeTableInfoTrie.removeAll()
            for s in self.timeTableInfo
            {
                if(s.weekDayID == "6")
                {
                    self.timeTableInfoTrie.append(s)
                }
            }
             print(timeTableInfoTrie.count)
        }
        self.tableviewTimeTable.reloadData()
    }

   

}
extension TimeTableViewController: UITableViewDataSource , UITableViewDelegate
{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.timeTableInfoTrie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewTimeTable.dequeueReusableCell(withIdentifier: "tableViewTimeTable", for: indexPath) as! TimeTableViewCell
        cell.Subject.text = timeTableInfoTrie[indexPath.row].subject + "   "
        if(self.batchId == "")
        {
              cell.className.text = "  " + timeTableInfoTrie[indexPath.row].classSubject
        }
        else
        {
            cell.className.isHidden = true
        }
        cell.timeClass.text = timeTableInfoTrie[indexPath.row].startTime + "-" + timeTableInfoTrie[indexPath.row].endTime


        return cell
    }
    
    
}
