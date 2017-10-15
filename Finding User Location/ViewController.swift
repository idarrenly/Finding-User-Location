//
//  ViewController.swift
//  Finding User Location
//
//  Created by dly on 10/14/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Specify delegate
        locationManager.delegate = self
        
        //Accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        //Request permission to use location while app is in use
        locationManager.requestWhenInUseAuthorization()
        
        //Start updating location after permission is granted
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Function
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
    }


}

