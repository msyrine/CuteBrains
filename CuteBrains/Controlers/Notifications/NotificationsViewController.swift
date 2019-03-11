//
//  NotificationsViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/7/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire

class NotificationsViewController: UIViewController {

    @IBOutlet weak var notificationTable: UITableView!
    
    var notifs = [Notifications] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "http://68.183.81.236:60/dev/cute%20brains/notifications.php"
        
        let headers:  HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            ]
        
        let parametres = [
            "admission_num": AppDelegate.currentUser.userName!,
            "all": "1",
            "isEmployee": "1"
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
                        let content = new["content"]! as! String
                        let initiator = new["initiator"]! as! String
                        let created_at = new["created_at"]! as! String
                        let is_read = new["is_read"]! as! String
                        let type = new["type"]! as! String
                    
                        
                        let n = Notifications(content: content, initiator: initiator, created_at: created_at, is_read: is_read, type: type)
                        
                        self.notifs.append(n)
                        
                    }
                    
                    
                    
                    
                    
                    self.notificationTable.reloadData()
                }
                
                
                
        }
    }
    

   

}
