//
//  LocationManager.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
        // For always access use: locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Location access granted.")
        case .denied, .restricted:
            print("Location access denied.")
        default:
            break
        }
    }
    
    func getCurrentLocation() -> CLLocationCoordinate2D? {
        return locationManager.location?.coordinate
    }
}
