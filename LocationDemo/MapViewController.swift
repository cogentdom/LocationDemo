//
//  MapViewController.swift
//  LocationDemo
//
//  Created by Dominik Huffield on 4/28/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mpView: MKMapView!
    let locationM = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLoc((Any).self)
        
        let loc = CLLocationCoordinate2D(latitude: 69, longitude: -69)
        
        let cs = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let rg = MKCoordinateRegion(center: loc, span: cs)
        mpView.setRegion(rg, animated: true)
        
        let ann = MKPointAnnotation()
        ann.coordinate = loc
        ann.title = "abc"
        ann.subtitle = "xyz"
        mpView.addAnnotation(ann)
        // Do any additional setup after loading the view.
        
    }
    
    func getLoc(_ sender: Any) {
        locationM.delegate = self
        locationM.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) -> CLLocation {
        if let cl = locations.last {
            print("the current location", cl)
            return cl
        }
        return locations.last!
    }
}
