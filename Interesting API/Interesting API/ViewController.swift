//
//  ViewController.swift
//  Interesting API
//
//  Created by Matt Bradshaw on 3/18/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet private var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let startingPoint = CLLocation(latitude: 42.0987, longitude: -75.9180)
        map.zoomToLocation(startingPoint)


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
