//
//  ViewController.swift
//  Interesting API
//
//  Created by Matt Bradshaw on 3/18/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var latitude: UITextField!
    @IBOutlet var longitude: UITextField!
    @IBOutlet var letsGo: UIButton!
    @IBOutlet var invalid: UILabel!
    @IBOutlet var validLats: UILabel!
    @IBOutlet var validLongs: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startingPoint = CLLocation(latitude: 42.0987, longitude: -75.9180)
        mapView.zoomToLocation(startingPoint)
    }
    
    @IBAction func moveLocation(_ sender: UIButton) {
        
        // Everything defaults to the original location's Lat and/or Long if a text field is left blank
        let newLat = Double(latitude.text!) ?? 42.0987
        let newLong = Double(longitude.text!) ?? -75.9180
        
        var newLocation = CLLocation(latitude: 42.0987, longitude: -75.9180)
        
        // If Lat and Long are in the acceptable range, zoom to that location
        if(newLat > -90 && newLat < 90 && newLong > -180 && newLong < 180) {
            newLocation = CLLocation(latitude: newLat, longitude: newLong)
            invalid.text = ""
            validLats.text = ""
            validLongs.text = ""
        }
        else {
            invalid.text = "Invalid Lat/Long"
            validLats.text = "(-90,90) /"
            validLongs.text = "(-180,180)"
        }
                
        mapView.zoomToLocation(newLocation)
    }
}

private extension MKMapView {
  func zoomToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 700
  ) {
    
    let cRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(cRegion, animated: true)
  }
}
