//
//  NewsViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/4/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var tableViewNews: UITableView!
    
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "LeftArrow.png")
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "LeftArrow.png")
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        let url = "http://156.67.221.128:60/cute%20brains/announcement.php"
        
        let headers:  HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            ]
        
        let parametres = [
            "admission_num": AppDelegate.currentUser.accessToken
        ]
        
        Alamofire.request(url, method: .post, parameters: parametres as Parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    
                    print(error)
                    print("erreeeuuur ")
                case .success(let value):
                     let json = value as? NSArray
                     for  v in (json as! NSArray)
                     {
                        let new = v as! Dictionary<String,AnyObject>
                        let author = new["author"]! as! String
                        let content = new["content"]! as! String
                        let date = new["date"]! as! String
                        let title = new["title"]! as! String
                        
                        let n = News(nameUser: author, titleNews: title, dateCreationNews: date, descriptionNews: content)
                        
                        self.news.append(n)

                    }
                      self.tableViewNews.reloadData()
                }
                
                self.tableViewNews.rowHeight = UITableView.automaticDimension
        }
      
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellNews") as! NewsTableViewCell
        
        cell.nameUser.text = news[indexPath.row].nameUser
        cell.titleNews.text = news[indexPath.row].titleNews
        cell.descriptionNews.text = news[indexPath.row].descriptionNews
        cell.dateCreationNews.text = news[indexPath.row].dateCreationNews
        
        return cell
    }
    
  

}
