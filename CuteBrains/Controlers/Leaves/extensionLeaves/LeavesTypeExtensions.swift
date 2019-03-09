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
        var count: Int
          if (tableView == LeavesTypeTableView)
          {
            count = LeaveTypeTable.count
        }
          else{
            count = MyLeavesTable.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat
        if (tableView == LeavesTypeTableView)
        {
            height = 21
        }
        else{
            height = 78.5
            
        }
        return height
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == LeavesTypeTableView,
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeaveTypeCell") as? LeaveTypeTableViewCell {
            let cell = self.LeavesTypeTableView.dequeueReusableCell(withIdentifier: "LeaveTypeCell", for: indexPath) as? LeaveTypeTableViewCell
            cell?.LeaveType.text = LeaveTypeTable[indexPath.row].nameLeave
            cell?.LeaveTaken.text = LeaveTypeTable[indexPath.row].leave_taken
            cell?.TotalLeaves.text = LeaveTypeTable[indexPath.row].leave_count
            return cell ?? LeaveTypeTableViewCell()
        } else if tableView == self.MyLeavesTableView,
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyLeavesCell") as? MyLeavesTableViewCell {
            cell.StartDate.text = "start day: " + self.MyLeavesTable[indexPath.row].start_date
            cell.ForDays.text = "For " + self.MyLeavesTable[indexPath.row].days + " days"
            cell.reason.text = "Reason" + self.MyLeavesTable[indexPath.row].reason
            return cell ?? MyLeavesTableViewCell()
        }
        
      
        
        return UITableViewCell()
    }
    
    
    
}
