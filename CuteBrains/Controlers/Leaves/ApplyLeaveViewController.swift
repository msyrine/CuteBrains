//
//  ApplyLeaveViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/5/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire

class ApplyLeaveViewController: UIViewController{
   
    

  
    @IBOutlet weak var startDay: UITextField!
    
    @IBOutlet weak var ToTextField: UITextField!
    
    @IBOutlet weak var buttIsHalfDay: UIButton!
    
    @IBOutlet weak var buttLeaveType: UIButton!
    
    @IBOutlet weak var viewIsHalfDay: UIView!
    
    @IBOutlet weak var ReasonTextField: UITextField!
    
    
    @IBOutlet weak var stackViewButtons: UIStackView!
    @IBOutlet weak var buttYes: UIButton!
    
    @IBOutlet weak var buttNo: UIButton!
    
    @IBOutlet weak var buttCasualLeave: UIButton!
    
    @IBOutlet weak var buttCasualLeaveOne: UIButton!
    
    @IBOutlet weak var buttEarnedLeave: UIButton!
    
    @IBOutlet weak var buttEarnedLeaveOne: UIButton!
    
    @IBOutlet weak var buttSickLeave: UIButton!
    
    @IBOutlet weak var buttHalfDayLeave: UIButton!
    
    @IBOutlet weak var buttMaternityLeave: UIButton!
    
    @IBOutlet weak var LeaveTypeView: UIView!
    
    @IBOutlet weak var effectView: UIVisualEffectView!
    var isHalfDayLeave = ""
    var leaveType = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.effectView.isHidden = true
        self.stackViewButtons.isHidden = true
      self.buttCasualLeave.isHidden = true
      self.viewIsHalfDay.isHidden = true
        self.LeaveTypeView.isHidden = true
        self.buttCasualLeaveOne.isHidden = true
        self.buttEarnedLeave.isHidden = true
        self.buttEarnedLeaveOne.isHidden = true
        self.buttNo.isHidden = true
        self.buttYes.isHidden = true
        self.buttHalfDayLeave.isHidden = true
        self.buttMaternityLeave.isHidden = true
        self.buttSickLeave.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func applyLeaveButton(_ sender: Any) {
        
        let url = "http://68.183.81.236:60/dev/cute%20brains/submit_leave.php"
        
        let headers:  HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            ]
        
        let parametres = [
             "type": self.leaveType,
             "admission_no": AppDelegate.currentUser.userName!,
             "start_date": self.startDay.text!,
             "typend_datee": self.ToTextField.text!,
             "reason": self.ReasonTextField.text!,
             "isHalf": self.isHalfDayLeave
            ] as [String : Any]
        
        Alamofire.request(url, method: .post, parameters: parametres as Parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    
                    print(error)
                    print("erreeeuuur ")
                case .success(let value):
                    print(value)
                 
                }
                
                
                
        }
        
    }

    @IBAction func isHalfDayButton(_ sender: Any) {
          self.viewIsHalfDay.isHidden = false
        self.buttNo.isHidden = false
        self.buttYes.isHidden = false
         self.effectView.isHidden = false
    }
    
    
    @IBAction func isLeaveTypeButton(_ sender: Any) {
        self.stackViewButtons.isHidden = false
        self.LeaveTypeView.isHidden = false
        self.buttCasualLeave.isHidden = false
        self.buttCasualLeaveOne.isHidden = false
        self.buttEarnedLeave.isHidden = false
        self.buttEarnedLeaveOne.isHidden = false
        self.buttHalfDayLeave.isHidden = false
        self.buttMaternityLeave.isHidden = false
        self.buttSickLeave.isHidden = false
         self.effectView.isHidden = false
    }
    
  
    @IBAction func YesButton(_ sender: Any) {
        self.buttIsHalfDay.setTitle("Yes", for: .normal)
        self.isHalfDayLeave = "Yes"
        self.viewIsHalfDay.isHidden = true
        self.buttNo.isHidden = true
        self.buttYes.isHidden = true
         self.effectView.isHidden = true
    }
    
    @IBAction func NoButton(_ sender: Any) {
        self.buttIsHalfDay.setTitle("No", for: .normal)
        self.isHalfDayLeave = "No"
        self.viewIsHalfDay.isHidden = true
        self.buttNo.isHidden = true
        self.buttYes.isHidden = true
         self.effectView.isHidden = true
    }
    
    
    @IBAction func CasualLeaveButton(_ sender: Any) {
        self.buttLeaveType.setTitle("Casual Leave", for: .normal)
        self.leaveType = "Casual Leave"
          self.stackViewButtons.isHidden = true
        self.LeaveTypeView.isHidden = true
        self.buttCasualLeave.isHidden = true
        self.buttCasualLeaveOne.isHidden = true
        self.buttEarnedLeave.isHidden = true
        self.buttEarnedLeaveOne.isHidden = true
        self.buttHalfDayLeave.isHidden = true
        self.buttMaternityLeave.isHidden = true
        self.buttSickLeave.isHidden = true
         self.effectView.isHidden = true
    }
    
    @IBAction func CasualLeaveOneButton(_ sender: Any) {
        self.buttLeaveType.setTitle("Casual Leave 1", for: .normal)
        self.leaveType = "Casual Leave 1"
          self.stackViewButtons.isHidden = true
        self.LeaveTypeView.isHidden = true
        self.buttCasualLeave.isHidden = true
        self.buttCasualLeaveOne.isHidden = true
        self.buttEarnedLeave.isHidden = true
        self.buttEarnedLeaveOne.isHidden = true
        self.buttHalfDayLeave.isHidden = true
        self.buttMaternityLeave.isHidden = true
        self.buttSickLeave.isHidden = true
         self.effectView.isHidden = true
    }
    
    
    @IBAction func EarnedLeaveButton(_ sender: Any) {
        self.buttLeaveType.setTitle("Earned Leave", for: .normal)
        self.leaveType = "Earned Leave"
        self.stackViewButtons.isHidden = true
        self.LeaveTypeView.isHidden = true
        self.buttCasualLeave.isHidden = true
        self.buttCasualLeaveOne.isHidden = true
        self.buttEarnedLeave.isHidden = true
        self.buttEarnedLeaveOne.isHidden = true
        self.buttHalfDayLeave.isHidden = true
        self.buttMaternityLeave.isHidden = true
        self.buttSickLeave.isHidden = true
         self.effectView.isHidden = true
    }
    
    @IBAction func EarnedLeaveOneButton(_ sender: Any) {
        self.buttLeaveType.setTitle("Earned Leave 1", for: .normal)
        self.leaveType = "Earned Leave 1"
        self.stackViewButtons.isHidden = true
        self.LeaveTypeView.isHidden = true
        self.buttCasualLeave.isHidden = true
        self.buttCasualLeaveOne.isHidden = true
        self.buttEarnedLeave.isHidden = true
        self.buttEarnedLeaveOne.isHidden = true
        self.buttHalfDayLeave.isHidden = true
        self.buttMaternityLeave.isHidden = true
        self.buttSickLeave.isHidden = true
         self.effectView.isHidden = true
    }
    
    @IBAction func SickLeaveButton(_ sender: Any) {
        self.buttLeaveType.setTitle("Sick Leave", for: .normal)
        self.leaveType = "Sick Leave"
        self.stackViewButtons.isHidden = true
        self.LeaveTypeView.isHidden = true
        self.buttCasualLeave.isHidden = true
        self.buttCasualLeaveOne.isHidden = true
        self.buttEarnedLeave.isHidden = true
        self.buttEarnedLeaveOne.isHidden = true
        self.buttHalfDayLeave.isHidden = true
        self.buttMaternityLeave.isHidden = true
        self.buttSickLeave.isHidden = true
         self.effectView.isHidden = true
    }
    
    @IBAction func HalfDayLeave(_ sender: Any) {
        self.buttLeaveType.setTitle("Half Day", for: .normal)
        self.leaveType = "Half Day"
        self.stackViewButtons.isHidden = true
        self.LeaveTypeView.isHidden = true
        self.buttCasualLeave.isHidden = true
        self.buttCasualLeaveOne.isHidden = true
        self.buttEarnedLeave.isHidden = true
        self.buttEarnedLeaveOne.isHidden = true
        self.buttHalfDayLeave.isHidden = true
        self.buttMaternityLeave.isHidden = true
        self.buttSickLeave.isHidden = true
         self.effectView.isHidden = true
    }
    
    
    @IBAction func MaternityLeaveButton(_ sender: Any) {
        self.buttLeaveType.setTitle("Maternity Leave", for: .normal)
        self.leaveType = "Maternity Leave"
        self.LeaveTypeView.isHidden = true
        self.stackViewButtons.isHidden = true
        self.buttCasualLeave.isHidden = true
        self.buttCasualLeaveOne.isHidden = true
        self.buttEarnedLeave.isHidden = true
        self.buttEarnedLeaveOne.isHidden = true
        self.buttHalfDayLeave.isHidden = true
        self.buttMaternityLeave.isHidden = true
        self.buttSickLeave.isHidden = true
         self.effectView.isHidden = true
    }
}
