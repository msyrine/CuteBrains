//
//  MyLeavesViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/28/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire

class MyLeavesViewController: UIViewController {
    
    
    @IBOutlet weak var MyLeavesTableView: UITableView!
    var MyLeavesTable = [MyLeaves]()
    
    @IBOutlet weak var LeavesTypeTableView: UITableView!
    
    var LeaveTypeTable = [LeaveType]()

    @IBOutlet weak var heightOfTableView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = "http://68.183.81.236:60/dev/cute%20brains/my_leaves.php"
        
        let headers:  HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            ]
        
        let parametres = [
            "admission_num": "T010"
        ]
        
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
                        let nameLeave = new["name"]! as! String
                        let leave_count = new["leave_count"]! as! String
                        let leave_taken = new["leave_taken"]! as! String
                        let is_additional = new["is_additional"]! as! String
                        let available_leavess = new["available_leavess"]! as! String
                        let sum_leave_count = new["sum_leave_count"]! as! String
                        let sum_leave_taken = new["sum_leave_taken"]! as! String

                        let n = LeaveType(nameLeave: nameLeave, leave_count: leave_count, leave_taken: leave_taken, is_additional: is_additional, available_leavess: available_leavess, sum_leave_count: sum_leave_count, sum_leave_taken: sum_leave_taken)
                        
                        self.LeaveTypeTable.append(n)
                        
                    }
                    
                  
                    
                    if(self.LeaveTypeTable.count > 3)
                    {
                        self.heightOfTableView.constant = 129
                    }
                    else
                    {
                        self.heightOfTableView.constant = CGFloat(40 * self.LeaveTypeTable.count)
                    }
                    
                    
                    self.LeavesTypeTableView.reloadData()
                }
                
               
                
        }
        
        
        
        
        
        let urlMyLeaves = "http://68.183.81.236:60/dev/cute%20brains/my_leaves_app.php"
        
        let headersMyLeaves:  HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            ]
        
        let parametresMyLeaves = [
            "admission_num": "T010"
        ]
        
        Alamofire.request(urlMyLeaves, method: .post, parameters: parametresMyLeaves as Parameters, encoding: URLEncoding.default, headers: headersMyLeaves)
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
                      //  let nameLeave = new["name"]! as! String
                        let is_half_day = new["is_half_day"]! as! String
                        let reason = new["reason"]! as! String
                        let start_date = new["start_date"]! as! String
                        let days = new["days"]! as! String
                        
                        
                        let n = MyLeaves(days: days, start_date: start_date, reason: reason, is_half_day: is_half_day)
                        
                        self.MyLeavesTable.append(n)
                        
                    }
                    
                    
                    
                   
                    
                    self.MyLeavesTableView.reloadData()
                }
                
              
        }
        
//
//        DispatchQueue.main.async {
//            self.LeavesTypeTableView.reloadData()
//        }
        // Do any additional setup after loading the view.
    }
    


}
