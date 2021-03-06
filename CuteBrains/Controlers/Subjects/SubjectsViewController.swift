//
//  SubjectsViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/5/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire

class SubjectsViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var SubjectTableView: UITableView!
    
    var SubjectTables = [Subjects]()
    
    var batchId = ""
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if(batchId != "")
        {
         url = "http://68.183.81.236:60/dev/cute%20brains/subjects_employee.php"
        }
        else
        {
         url = "http://68.183.81.236:60/dev/cute%20brains/subjects.php"
        }
        let headers:  HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            ]
        
        var parametres = Dictionary<String,AnyObject>()
        
        if(batchId == "")
        {
            parametres = [
               "admission_num": AppDelegate.currentUser.userName!
                ] as [String : AnyObject]
        }
        else
        {
            parametres = [
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
                        let name = new["name"]! as! String
                        let code = new["code"]! as! String
                        let max_weekly_classes = new["max_weekly_classes"]! as! String
                        let first_name = new["first_name"]! as! String
                       
                        
                        let n = Subjects(name: name, code: code, max_weekly_classes: max_weekly_classes, first_name: first_name)
                        
                        self.SubjectTables.append(n)
                        
                    }
                    
                    
                    
                   
                    
                    self.SubjectTableView.reloadData()
                }
                
                
                
        }
       
    }
    


}
