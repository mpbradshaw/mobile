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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let startingPoint = CLLocation(latitude: 42.0987, longitude: -75.9180)
        mapView.zoomToLocation(startingPoint)
    }
    
    @objc func moveLocation() {
        let newLat = Float(latitude.text!)
        let newLong = Float(longitude.text!)
//        let newLocation = CLLocation(latitude: newLat, longitude: newLong)
//        map.zoomToLocation(newLocation)
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
