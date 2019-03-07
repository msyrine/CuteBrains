//
//  TestSpinnerViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/7/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

class TestSpinnerViewController: UIViewController {
    @IBOutlet weak var viewHidden: UIView!
    
    @IBOutlet weak var ButtOne: UIButton!
    
    @IBOutlet weak var ButtTwo: UIButton!
    
    @IBOutlet weak var ButtThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewHidden.isHidden = true
        self.ButtOne.isHidden = true
        self.ButtTwo.isHidden = true
        self.ButtThree.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ButtonIsHalfDay: UIButton!
    
    @IBAction func isHalfDayButton(_ sender: Any) {
        self.viewHidden.isHidden = false
        self.ButtOne.isHidden = false
        self.ButtTwo.isHidden = false
        self.ButtThree.isHidden = false
        
    }
    
    @IBAction func oneButton(_ sender: Any) {
        self.ButtonIsHalfDay.setTitle("One", for: .normal)
        self.viewHidden.isHidden = true
        self.ButtOne.isHidden = true
        self.ButtTwo.isHidden = true
        self.ButtThree.isHidden = true
        
    }
    
    @IBAction func twoButton(_ sender: Any) {
             self.ButtonIsHalfDay.setTitle("two", for: .normal)
        self.viewHidden.isHidden = true
        self.ButtOne.isHidden = true
        self.ButtTwo.isHidden = true
        self.ButtThree.isHidden = true
        
    }
    
    @IBAction func threeButton(_ sender: Any) {
             self.ButtonIsHalfDay.setTitle("three", for: .normal)
        self.viewHidden.isHidden = true
        self.ButtOne.isHidden = true
        self.ButtTwo.isHidden = true
        self.ButtThree.isHidden = true
        
    }
    
}
