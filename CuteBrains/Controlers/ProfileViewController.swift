//
//  ProfileViewController.swift
//  CuteBrains
//
//  Created by sayednasri on 20/01/2019.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash
import AlamofireXmlToObjects
import SwiftyXMLParser

class ProfileViewController: UIViewController {
    var AnnoncesArray = [AnyObject]()

    @IBOutlet weak var imageUser: UIImageView!
    
    @IBOutlet weak var NameUser: UILabel!
    
    @IBOutlet weak var CodeUser: UILabel!
    
    @IBOutlet weak var joiningDate: UILabel!
    @IBOutlet weak var EmployeeDepartment: UILabel!
    @IBOutlet weak var EmployeeCategory: UILabel!
    @IBOutlet weak var EmployeePosition: UILabel!
    @IBOutlet weak var EmployeeGrade: UILabel!
    @IBOutlet weak var JobTitle: UILabel!
    @IBOutlet weak var ReportingManager: UILabel!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Qualification: UILabel!
    @IBOutlet weak var TotalExperience: UILabel!
    @IBOutlet weak var ExperienceInfo: UILabel!
    @IBOutlet weak var DateOfBirth: UILabel!
    @IBOutlet weak var MaritalStatus: UILabel!
    @IBOutlet weak var BloodGroup: UILabel!
    @IBOutlet weak var Nationality: UILabel!
    @IBOutlet weak var HomeAddress: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var State: UILabel!
    @IBOutlet weak var Country: UILabel!
    @IBOutlet weak var PinCode: UILabel!
    @IBOutlet weak var Mobile: UILabel!
    var url = ""
   
    
    
    
   // private var rssItem: [RSSItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageUser.layer.borderWidth = 1
        imageUser.layer.masksToBounds = false
        imageUser.layer.cornerRadius = imageUser.frame.height/2
        imageUser.clipsToBounds = true
        
        self.NameUser.text = AppDelegate.currentUser.fullName!
        self.Email.text = AppDelegate.currentUser.email!
        self.CodeUser.text = AppDelegate.currentUser.userName!

     //   print(self.url)
    
    /*    getData( flag: true,completionHandler: { success in
            print("done")
            print(self.AnnoncesArray.count)
        })*/
      //  print(url)
        
        if(AppDelegate.currentUser.isEmployee)
        {
            self.url = "http://marwen1994.alwaysdata.net/parsexml.php?xmlurl=http://schools.cutebrains.com/api/employees/"+AppDelegate.currentUser.userName+"&token="+AppDelegate.currentUser.accessToken
        }
        else
        {
            self.url = "http://marwen1994.alwaysdata.net/parsexml.php?xmlurl=http://schools.cutebrains.com/api/student/"+AppDelegate.currentUser.userName+"&token="+AppDelegate.currentUser.accessToken
        }
        
       Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.queryString, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    
                    print(error)
                case .success(let value):
                      let json = value as? Dictionary<String, AnyObject>
                      if(AppDelegate.currentUser.isEmployee)
                      {
                    if (json != nil)
                    {
                         if (json?["employee"] != nil)
                         {
                            let employee = json?["employee"]! as! Dictionary<String, AnyObject>
                            if (employee["joining_date"] != nil)
                            {
                                self.joiningDate.text = employee["joining_date"]! as! String
                            }
                            
                            if (employee["employee_department"] != nil)
                            {
                                self.EmployeeDepartment.text = employee["employee_department"]! as! String
                            }
                            
                            if (employee["employee_category"] != nil)
                            {
                                self.EmployeeCategory.text = employee["employee_category"]! as! String
                            }
                            
                            if (employee["employee_position"] != nil)
                            {
                                self.EmployeePosition.text = employee["employee_position"]! as! String
                            }
                            
                            if (employee["employee_grade"] != nil)
                            {
                                self.EmployeeGrade.text = ""
                                
                               let EmpGrade = employee["employee_grade"]! as! Dictionary<String, AnyObject>
                                if(EmpGrade.count != 0)
                                {
                                    self.EmployeeGrade.text = EmpGrade["0"]! as! String
                                }
                            }
                            
                            if (employee["job_title"] != nil)
                            {
                                self.JobTitle.text = employee["job_title"]! as! String
                            }
                            
                            if (employee["reporting_manager"] != nil)
                            {
                                self.ReportingManager.text = employee["reporting_manager"]! as! String
                            }
                            
                            if (employee["gender"] != nil)
                            {
                                self.Gender.text = employee["gender"]! as! String
                            }
                            
                            if (employee["qualification"] != nil)
                            {
                                self.Qualification.text = employee["qualification"]! as! String
                            }
                            
                            if (employee["total_experiance"] != nil)
                            {
                                self.TotalExperience.text = employee["total_experiance"]! as! String
                            }
                            
                            if (employee["experiance_info"] != nil)
                            {
                                self.ExperienceInfo.text = ""//employee["experiance_info"]! as! String
                            }
                            
                            if (employee["date_of_birth"] != nil)
                            {
                                self.DateOfBirth.text = employee["date_of_birth"]! as! String
                            }

                            if (employee["marital_status"] != nil)
                            {
                                self.MaritalStatus.text = employee["marital_status"]! as! String
                            }
                            
                            if (employee["blood_group"] != nil)
                            {
                                self.BloodGroup.text = employee["blood_group"]! as! String
                            }
                            
                            if (employee["nationality"] != nil)
                            {
                                self.Nationality.text = employee["nationality"]! as! String
                            }
                            
                            if (employee["home_address"] != nil)
                            {
                                self.HomeAddress.text = ""//employee["home_address"]! as! String
                                
                                 let HmAdress = employee["home_address"]! as! Dictionary<String, AnyObject>
                                 if(HmAdress.count != 0)
                                 {
                                    let add = HmAdress["0"]! as! String
                                    self.HomeAddress.text = add
                                 }
                            }
                            
                            if (employee["city"] != nil)
                            {
                                self.City.text = ""
                                 let c = employee["city"]! as! Dictionary<String, AnyObject>
                                if(c.count != 0)
                                {
                                    self.City.text = c["0"]! as! String
                                }
                                
                            }
                            
                            if (employee["country"] != nil)
                            {
                                self.Country.text = ""
                                if ((employee["country"]) != nil)
                               {
                                
                                self.Country.text = employee["country"]! as! String
                                }
                                
                            }
                            
                            if (employee["pin_code"] != nil)
                            {
                                self.PinCode.text = ""
                                let pncd = employee["pin_code"]! as! Dictionary<String, AnyObject>
                               if(pncd.count != 0)
                               {
                                self.PinCode.text =  pncd["0"]! as! String
                                }
                            }
                            
                            
                            if (employee["mobile"] != nil)
                            {
                                self.Mobile.text = employee["mobile"]! as! String
                            }
                        }
                        
                        }
                    else{
                        
                        }

                    }
                }
        }
        
    }
        
        
        
   /*  let headers:  HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Token token=\""+AppDelegate.currentUser.accessToken+"\""
        ]*/
        
     /*   Alamofire.request(.GET, , headers: headers)
            .response{
                
        }*/
        
      
    /*    request{ (response:DataResponse<Any>) in
            print("d5al")
            
            
            switch response.result{
            case .failure(let error):
                print("/**** erreuuur ****/")
                print(error)
            case .success(let value):
                print("/**** succeeess ****/")
                print(value)
            }
        }*/
        
      
        
  /*      Alamofire.request(self.url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .responseData { response in
            /*
              if let data = response.result.value {
                    let xml = XML.parse(data)
                print(xml.employee_detail.employee.employee_name.text)
                }
               */
                
              //  let data = string.dataUsingEncoding(String.Encoding.utf8)
             //   let xml = XML.parse(data)
             //   print(xml)
                
               // xml = try! XML.parse(string)
                
                switch response.result{
                case .failure(let error):
                    print("/**** erreuuur ****/")
                    print(error)
                case .success(let value):
                    print(value)
                    let xml = XML.parse(response.result.value!)
                    print("/**** debut xml ******/")
                    print (xml)
                    print("/**** fin xml ******/")
                 //let element = xml["employee_detail"].["employee"].["employee_name"].Hit
                   
               // let element = xml.employee_detail.employee.employee_name.text
              //   let element = xml["employee_detail","employee" ,"employee_department"].text
              //      print(element)
                    
                  
                }
                
        }*/
            
                
        
     
    //    fetchData()
        
    
    
  /*-  private func fetchData()
    {
        let feedParser = FeedParser()
        feedParser.parseFeed(url: url) { (rssItem) in
           // self.rssItem = rssItem
            
        }
    }*/
  
    
  /*  public func getData (flag:Bool, completionHandler: @escaping (Bool) -> Void )
    {
        Alamofire.request(url).responseJSON
            {
                response  in
 
                //getting the json value from the server
                let result = response.result
                if let dict = result.value as? Dictionary<String,AnyObject>{
                    print(dict)
                    self.AnnoncesArray = dict["employee"] as! [AnyObject]
                   // self.AnnoncesArray = dict["annonces"] as! [AnyObject]
                    
                    //  self.BarsArray = innerdict as! [AnyObject]
                    // let val = jsonData.value(forKey: "") as! [[String:Any]]
                    
                    
                    
                    
                    
                }
               
                completionHandler(true)
                }
        
    }*/
    
   
}
