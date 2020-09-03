//  GoogleMapSeRvice.swift
//  GoogleMapsProject
//  Created by Ranjeet Raushan on 24/07/20.
//  Copyright © 2020 Infoxen. All rights reserved.

import UIKit
import  CoreLocation
import GoogleMaps

class GoogleMapSeRvice: UIViewController,CLLocationManagerDelegate {
        
     @IBOutlet weak var myView: UIView!
    let locationManager = CLLocationManager()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.showCurrentLocationOnMap()
        self.locationManager.stopUpdatingLocation()
    }
    func showCurrentLocationOnMap(){
        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 14)
        let mapView =  GMSMapView.map(withFrame: CGRect(x: 0,y: 0,width: self.myView.frame.size.width,height: self.myView.frame.size.height), camera: camera)
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        let marker = GMSMarker()
       
        let markerImage = UIImage(named: "bike3")!
        //creating a marker view
        let markerView = UIImageView(image: markerImage)

    

        marker.iconView = markerView
        marker.map = mapView

        //comment this line if you don't wish to put a callout bubble
        mapView.selectedMarker = marker
       
         marker.position = camera.target
         marker.snippet = "Users Current Location"
         self.myView.addSubview(mapView)
                

  }
}



