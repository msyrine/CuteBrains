//
//  HomeViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/8/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var viewSubjects: UIView!
    @IBOutlet weak var viewFees: UIView!
    @IBOutlet weak var LabelMyLeavesMyAttendance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(AppDelegate.currentUser.isEmployee)
        {
            LabelMyLeavesMyAttendance.text = "My Leaves"
            self.viewSubjects.isHidden = true
            self.viewFees.isHidden = true
            
        }
        else{
            LabelMyLeavesMyAttendance.text = "My attendance"
            self.viewSubjects.isHidden = false
            self.viewFees.isHidden = false
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
