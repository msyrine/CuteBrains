//
//  MapViewController.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 2/5/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class MapViewController: UIViewController {
    
     var  timer: Timer!

    @IBOutlet weak var mapview: MKMapView!
    
    var places = [GpsModel]()
    let url = "http://mapgengps.com/jsp/Service.jsp?user=Stxaviersranchi&pass=123456&format=json"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(MapViewController.sayHello), userInfo: nil, repeats: true)

       
       // print(places.count)
        
    }
    
    
    @objc func sayHello()
    {
       updatePosition()
    }
    
    public func updatePosition()
    {
        print("//////////*******************************///////")
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    
                    print(error)
                    print("erreeeuuur ")
                case .success(let value):
                    //print (value)
                    let json = value as? Dictionary<String,AnyObject>
                    let root = json?["root"]! as! Dictionary<String,AnyObject>
                    let detaildata = root["detaildata"]! as! NSArray
                    for v in (detaildata )
                    {
                        
                       // print(v)
                        let transp = v as! Dictionary<String,AnyObject>
                        let currentLocation = transp["CurrentLocation"]! as! String
                        let Datetime = transp["Datetime"]! as! String
                        let GPS = transp["GPS"]! as! String
                        let POI = transp["POI"]! as! String
                        let Power = transp["Power"]! as! String
                        let Status = transp["Status"]! as! String
                        let Vehicle_No = transp["Vehicle_No"]! as! String
                        let Vehicletype = transp["Vehicletype"]! as! String
                        let lattitude = transp["lattitude"]! as! String
                        let longitude = transp["longitude"]! as! String
                        let speed = transp["speed"]! as! String
                        
                        let  gpsModel = GpsModel(status: Status, datetime: Datetime, vehicule_no: Vehicle_No, vehicule_type: Vehicletype, wpower: Power, gps: GPS, currentLocation: currentLocation, poi: POI, lat: lattitude, lg: longitude, speed: speed)
                        //  print(gpsModel)
                        self.places.append(gpsModel)
                        
                    }
                    
                    let lat = self.places[0].lat
                    let lang = self.places[0].lg
                    
                    
                    // To center the view in the first place of JSON
                    let center = CLLocationCoordinate2D(latitude: lat, longitude: lang)
                    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
                    self.mapview.setRegion(region, animated: true)
                    
                    // set Pin for locations
                    
                    
                    for g in self.places
                    {
                        
                        let CLLCoordType = CLLocationCoordinate2D(latitude: g.lat,
                                                                  longitude: g.lg);
                        let anno = MKPointAnnotation()
                        anno.coordinate = CLLCoordType
                        anno.title = g.Vehicletype + " " + g.Vehicle_No
                        self.mapview.addAnnotation(anno)
                    }
                    
                }
        }
    }
 
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         timer.invalidate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(MapViewController.sayHello), userInfo: nil, repeats: true)
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(MapViewController.sayHello), userInfo: nil, repeats: true)
    }
    

}
