//
//  StudentsExtensions.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/5/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

extension StudentsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = StudentTableView.dequeueReusableCell(withIdentifier: "StudentsCell", for: indexPath) as? StudentsTableViewCell
        
        cell?.name.text = self.students[indexPath.row].name
        cell?.admission_no.text = "Admission No. : " + self.students[indexPath.row].admission_no
        cell?.date_of_birth.text = "Birth number: " + self.students[indexPath.row].roll_number
        cell?.g_name.text = "Guardian name : " + self.students[indexPath.row].g_name
        cell?.g_phone.text = "Guardian phone : " + self.students[indexPath.row].g_phone
        
        return cell ?? StudentsTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.view.bounds.height / 2.5)
    }
    
}
