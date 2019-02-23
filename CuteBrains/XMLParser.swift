//
//  XMLParser.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 1/31/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import Foundation

struct RSSItem {
    var nameUser: String
    var codeUser: String
    var joiningDate: String
    var EmployeeDepartment: String
    var EmployeeCategory: String
    var EmployeePosition: String
    var EmployeeGrade: String
    var JobTitle: String
    var ReportingManager: String
    var Gender: String
    var Email: String
    var Qualification: String
    var TotalExperience: String
    var ExperienceInfo: String
    var DateOfBirth: String
    var MaritalStatus: String
    var BloodGroup: String
    var Nationality: String
    var HomeAddress: String
    var City: String
    var State: String
    var Country: String
    var PinCode: String
    var Mobile: String
 
}

// download xml from a server
// parse xml to foundation objects
// call back


class FeedParser: NSObject, XMLParserDelegate
{
    private var rssItem: [RSSItem] = []
    private var currentElement = ""
    private var nameUser: String = ""{
        didSet{
            nameUser = nameUser.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var codeUser: String = ""
    private var joiningDate: String = ""
    private var EmployeeDepartment: String = ""
    private var EmployeeCategory: String = ""
    private var EmployeePosition: String = ""
    private var EmployeeGrade: String = ""
    private var JobTitle: String = ""{
        didSet{
            JobTitle = JobTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var ReportingManager: String = ""{
        didSet{
            ReportingManager = ReportingManager.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var Gender: String = ""
    private var Email: String = ""
    private var Qualification: String = ""
    private var TotalExperience: String = ""{
        didSet{
            TotalExperience = TotalExperience.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var ExperienceInfo: String = ""{
        didSet{
            ExperienceInfo = ExperienceInfo.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var DateOfBirth: String = ""
    private var MaritalStatus: String = ""
    private var BloodGroup: String = ""
    private var Nationality: String = ""
    private var HomeAddress: String = ""{
        didSet{
            HomeAddress = HomeAddress.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var City: String = ""{
        didSet{
            City = City.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var State: String = ""{
        didSet{
            State = State.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var Country: String = ""{
        didSet{
            Country = Country.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var PinCode: String = ""
    private var Mobile: String = ""
    
    private var ParserCompletionHandler: (([RSSItem]) -> Void)?
    
    
    func parseFeed(url: String, completionHandler:(([RSSItem]) -> Void)?)
    {
        self.ParserCompletionHandler = completionHandler
        var request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Token token=\""+AppDelegate.currentUser.accessToken+"\"", forHTTPHeaderField: "Authorization")
        let task = urlSession.dataTask(with: request){ (data, response, error) in
            guard let data = data else
            {
                if let error = error {
                    print("task error")
                    print(error.localizedDescription)
                }
                return
            }
            
            // parse our xml date
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
            
        }
        task.resume()
    }
    
    // XML Parser Delegate
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
       ///////**************** copied from him, and must redo as me  ************////////
 
       if currentElement == "employee_detail"{
        nameUser = ""
        codeUser = ""
        joiningDate = ""
        EmployeeDepartment = ""
        EmployeeCategory = ""
        EmployeePosition = ""
        EmployeeGrade = ""
        JobTitle = ""
        ReportingManager = ""
        Gender = ""
        Email = ""
        Qualification = ""
        TotalExperience = ""
        ExperienceInfo = ""
        DateOfBirth = ""
        MaritalStatus = ""
        BloodGroup = ""
        Nationality = ""
        HomeAddress = ""
        City = ""
        State = ""
        Country = ""
        PinCode = ""
        Mobile = ""
        print("employee_detail")
        }
 
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        ///////**************** copied from him, and must redo as me  ************////////
       
        print(currentElement)
        
      /*  switch currentElement {
        case "title": currentTitle += string
        case "description": currentDescription += string
        case "pubDate": currentPubDate += string
            default= break
        }*/
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
     /*   if elementName == "item"
        {
            let rssItem = RSSItem(nameUser: <#T##String#>, codeUser: <#T##String#>, joiningDate: <#T##String#>, EmployeeDepartment: <#T##String#>, EmployeeCategory: <#T##String#>, EmployeePosition: <#T##String#>, EmployeeGrade: <#T##String#>, JobTitle: <#T##String#>, ReportingManager: <#T##String#>, Gender: <#T##String#>, Email: <#T##String#>, Qualification: <#T##String#>, TotalExperience: <#T##String#>, ExperienceInfo: <#T##String#>, DateOfBirth: <#T##String#>, MaritalStatus: <#T##String#>, BloodGroup: <#T##String#>, Nationality: <#T##String#>, HomeAddress: <#T##String#>, City: <#T##String#>, State: <#T##String#>, Country: <#T##String#>, PinCode: <#T##String#>, Mobile: <#T##String#>)
            
            self.rssItem.append(RSSItem)
        }*/
    }
    
    
    func parserDidEndDocument(_ parser: XMLParser) {
        ParserCompletionHandler?(rssItem)
    }
    
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("parser error")
        print(parseError.localizedDescription)
    }
}



