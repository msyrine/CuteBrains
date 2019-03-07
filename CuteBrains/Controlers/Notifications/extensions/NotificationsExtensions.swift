//
//  NotificationsExtensions.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/7/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notifs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTable.dequeueReusableCell(withIdentifier: "NotificationsCell", for: indexPath) as? NotificationsTableViewCell
        
        cell?.content.text = notifs[indexPath.row].content
        cell?.createdAt.text = notifs[indexPath.row].created_at
        cell?.initiator.text = notifs[indexPath.row].initiator
        
        
        //NotificationsCell
         return cell ?? NotificationsTableViewCell()
    }
    
    
}
