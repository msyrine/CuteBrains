//
//  MyClassTableViewCell.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/10/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

protocol myClassDelegate : class {
    func classIndex (index: String, target : String)
}


class MyClassTableViewCell: UITableViewCell {
    var batchId = ""
    @IBOutlet weak var nameClass: UILabel!
    
    @IBOutlet weak var buttonSubject: UILabel!
    
    @IBOutlet weak var buttonTimeTable: UIButton!
    
    @IBOutlet weak var buttonViewAttendance: UIButton!
    
    @IBOutlet weak var buttonStudents: UIButton!
    
    weak var classDelegate: myClassDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func SubjectsButton(_ sender: Any) {
        classDelegate?.classIndex(index: batchId, target: "Subjects")
    }
    
    
    @IBAction func TimeTableButton(_ sender: Any) {
         classDelegate?.classIndex(index: batchId, target: "TimeTable")
    }
    
    
    
    @IBAction func ViewAttendanceButton(_ sender: Any) {
         classDelegate?.classIndex(index: batchId,target: "ViewAttendance")
    }
    
    
    @IBAction func StudentsButton(_ sender: Any) {
         classDelegate?.classIndex(index: batchId, target: "Students")
    }
}
