//
//  LoginControler.swift
//  CuteBrains
//
//  Created by sayednasri on 17/01/2019.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginControler: UIViewController {
    
    var remember = false
    let client_id: String = "0519f18a7a36842285ce40b2d4b3d8ae18749ee9387c6bea1920589da1eefae8"
    let client_secret: String = "b0846581a7b622559c1012d04ae4ed6c0828fdf3b9c839fe9d05093ce1f41ee9"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

     
       

    }
    
    
    
    @IBOutlet weak var LoginTextView: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func SignIn(_ sender: Any) {
           let url = "http://schools.cutebrains.com/oauth/token"
        
        let parametres = [
            "client_id": self.client_id,
            "client_secret": self.client_secret,
            "grant_type": "password",
            "username": self.LoginTextView.text!,
            "password": self.PasswordTextField.text!,
            "redirect_uri": "http://schools.cutebrains.com"
        ]
        
        Alamofire.request(url, method: .post, parameters: parametres, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                   
                    print(error)
                    print("erreeeuuur ")
                case .success(let value):
                    let json = value as? Dictionary<String, AnyObject>
                    
                    if (json != nil)
                    {
                         if (json?["access_token"] != nil)
                         {
                            let accessToken = json?["access_token"]! as! String
                            let expiresIn = json?["expires_in"]! as! Int
                            let refreshToken = json?["refresh_token"]! as! String
                            print(accessToken)
                            if (json?["user_info"] != nil)
                            {
                                let userInfo = json?["user_info"]! as! Dictionary<String, AnyObject>
                                let email = userInfo["email"]! as! String
                                let fullName = userInfo["full_name"]! as! String
                                let type = userInfo["type"]! as! String
                                let userName = userInfo["username"]! as! String
                                
                                let user = User(accesToken: accessToken, type: type, email: email, userName: userName, fullName: fullName, refreshToken: refreshToken, expiresIn: expiresIn)
                                AppDelegate.currentUser = user
                                
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "nav2") as! UITabBarController
                                self.present(vc, animated: true, completion: nil)

                            }
                            else
                            {
                                let alert = UIAlertController(title: "Données invalides", message: "Vérifier vos données", preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "Recommencer", style: UIAlertAction.Style.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                         else
                         {
                            let alert = UIAlertController(title: "Données invalides", message: "Vérifier vos données", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Recommencer", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                        
                    }
                    else{
                        let alert = UIAlertController(title: "Données invalides", message: "Vérifier vos données", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Recommencer", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                   
                   
                    
                    
                 
                }
        }
        

        
        
    }
    
    @IBOutlet weak var RememberMeOutlet: UIButton!
    
    @IBAction func RememberMeAction(_ sender: Any) {
         if(!remember)
         {
            remember = true
            RememberMeOutlet.setImage(UIImage(named: "CheckBoxChecked.png"), for: UIControl.State.normal)
        }
        else
         {
            remember = false
            RememberMeOutlet.setImage(UIImage(named: "CheckBoxUnChecked.png"), for: UIControl.State.normal)
        }
        
    }
    
  
    
    
}
