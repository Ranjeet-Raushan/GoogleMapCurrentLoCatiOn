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
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    
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
        /* Todays code - starts here */
        let markerImage = UIImage(named: "bike3")!
        //creating a marker view
        let markerView = UIImageView(image: markerImage)

    

        marker.iconView = markerView
        marker.map = mapView

        //comment this line if you don't wish to put a callout bubble
        mapView.selectedMarker = marker
        /* Todays code - ends here */
         marker.position = camera.target
         self.myView.addSubview(mapView)
                

  }
}



