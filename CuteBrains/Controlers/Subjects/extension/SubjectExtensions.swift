//
//  SubjectExtensions.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/5/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

extension SubjectsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SubjectTables.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.view.bounds.height / 5 )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = SubjectTableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as? SubjectTableViewCell
        
        cell?.name.text = self.SubjectTables[indexPath.row].name
        cell?.code.text = self.SubjectTables[indexPath.row].code
        cell?.max_weekly_classes.text = "Weekly Classes : " + self.SubjectTables[indexPath.row].max_weekly_classes
        cell?.first_name.text = self.SubjectTables[indexPath.row].first_name

        
        return cell ?? SubjectTableViewCell()
    }
    
    //but
    
}
