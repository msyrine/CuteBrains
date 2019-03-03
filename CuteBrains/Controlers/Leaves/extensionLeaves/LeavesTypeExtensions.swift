//
//  LeavesTypeExtensions.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/28/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

extension MyLeavesViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LeaveTypeTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = self.LeavesTypeTableView.dequeueReusableCell(withIdentifier: "LeaveTypeCell", for: indexPath) as? LeaveTypeTableViewCell
        cell?.LeaveType.text = LeaveTypeTable[indexPath.row].nameLeave
        cell?.LeaveTaken.text = LeaveTypeTable[indexPath.row].leave_taken
        cell?.TotalLeaves.text = LeaveTypeTable[indexPath.row].leave_count
        
        return cell ??  UITableViewCell()
    }
    
    
    
}
