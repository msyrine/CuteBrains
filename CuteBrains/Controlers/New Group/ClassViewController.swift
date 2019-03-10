//
//  ClassViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/10/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire

class ClassViewController: UIViewController {
    
    @IBOutlet weak var myClassTableView: UITableView!
    
   var myClassTable = [MyClass]()
    
    var idBatch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "http://68.183.81.236:60/dev/cute%20brains/employee_batches.php"
        
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
                        let batch_id = new["batch_id"]! as! String
                        let namec = new["namec"]! as! String
                        let is_tutor = new["is_tutor"]! as! String
                        
                        
                        let n = MyClass(batch_id: batch_id, namec: namec, is_tutor: is_tutor)
                        
                        self.myClassTable.append(n)
                        
                    }
                    
                    
                    
                    
                    
                    
                    DispatchQueue.main.async {
                        self.myClassTableView.reloadData()
                    }
                }
                
                
                
        }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Subjects"
        {
            let subjectDestination = segue.destination as? SubjectsViewController
            subjectDestination?.batchId = self.idBatch
        }
        if segue.identifier == "TimeTable"
        {
            let subjectDestination = segue.destination as? TimeTableViewController
            subjectDestination?.batchId = self.idBatch
        }
        if segue.identifier == "ViewAttendance"
        {
//            let subjectDestination = segue.destination as? SubjectsViewController
//            subjectDestination?.batchId = self.idBatch
        }
        if segue.identifier == "Students"
        {
            let subjectDestination = segue.destination as? StudentsViewController
            subjectDestination?.batchId = self.idBatch
        }
    }

}
