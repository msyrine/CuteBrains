//
//  StudentsViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/5/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire

class StudentsViewController: UIViewController {

    @IBOutlet weak var StudentTableView: UITableView!
    
    var students = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let url = "http://68.183.81.236:60/dev/cute%20brains/batch_students.php"
        
        let headers:  HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            ]
        
        let parametres = [
            "batch_id": "17"
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
                        let id = new["id"]! as! String
                        let name = new["name"]! as! String
                        let g_name = new["g_name"]! as! String
                        let g_phone = new["g_phone"]! as! String
                        let gender = new["gender"]! as! String
                        let language = new["language"]! as! String
                        let date_of_birth = new["date_of_birth"]! as! String
                        let admission_no = new["admission_no"]! as! String
                        let roll_number = new["roll_number"]! as! String
                        let is_absent = new["is_absent"]! as! String
                        
                        let n = Student(id: id, name: name, g_name: g_name, g_phone: g_phone, gender: gender, language: language, date_of_birth: date_of_birth, admission_no: admission_no, roll_number: roll_number, is_absent: is_absent)
                        
                        self.students.append(n)
                        
                    }
                    
                    
                    
                    
                    
                    self.StudentTableView.reloadData()
                }
                
                
                
        }
   
    }
    

}
