//
//  ViewController.swift
//  LocationDemo
//
//  Created by Dominik Huffield on 4/28/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationM = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getLocation(_ sender: Any) {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .notDetermined:
            locationM.requestWhenInUseAuthorization()
            return
            
        case .denied, .restricted:
            let art = UIAlertController(title: "Locarion disabled", message: "kindly enable settings", preferredStyle: .alert)
            let act = UIAlertAction(title: "ok", style: .default, handler: nil)
            art.addAction(act)
            present(art, animated: true, completion: nil)
            return
            
        case .authorizedAlways, .authorizedWhenInUse:
        break
        }
        locationM.delegate = self
        locationM.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let cl = locations.last {
            print("the current location", cl)
        }
    }

}

