//
//  MyClassExtension.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/10/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

extension ClassViewController: UITableViewDelegate,UITableViewDataSource, myClassDelegate
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myClassTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassCell", for: indexPath) as? MyClassTableViewCell
        let myClass = myClassTable[indexPath.row]
        cell?.batchId = myClass.batch_id
        cell?.classDelegate = self
        cell?.nameClass.text = myClass.namec
        
        
        return cell ?? UITableViewCell()
        
    }
    
    func classIndex(index: String, target: String) {
        self.idBatch = index
        switch target {
        case "Subjects":
            performSegue(withIdentifier: "Subjects", sender: self)
        case "TimeTable":
            performSegue(withIdentifier: "TimeTable", sender: self)
        case "ViewAttendance":
            performSegue(withIdentifier: "ViewAttendance", sender: self)
        case "Students":
            performSegue(withIdentifier: "Students", sender: self)
        default:
            break
        }
    }
    

}
