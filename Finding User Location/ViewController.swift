//
//  ViewController.swift
//  Finding User Location
//
//  Created by dly on 10/14/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
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
        //print(locations)
        
        let userLocation: CLLocation = locations[0]
        
        //Location
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        //Zoom Level
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        //Span-Coordinate-Region
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        
        //Set Map
        mapView.setRegion(region, animated: true)
        
        //Annotation
        let annotation = MKPointAnnotation()
        annotation.title = "I'm right here"
        annotation.subtitle = "Still here"
        annotation.coordinate = coordinates
        mapView.addAnnotation(annotation)
    }


}

