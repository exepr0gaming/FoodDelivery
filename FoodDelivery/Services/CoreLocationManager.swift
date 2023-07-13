//
//  CoreLocationManager.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject {
  private let locationManager = CLLocationManager()
  @Published var city: String = ""
  
  override init() {
    super.init()
    locationManager.delegate = self
  }
  
  func startUpdatingLocation() {
    locationManager.requestWhenInUseAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.startUpdatingLocation()
    }
  }
  
  func stopUpdatingLocation() {
    locationManager.stopUpdatingLocation()
  }
  
  func format(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMMM, yyyy"
    dateFormatter.locale = Locale(identifier: "ru_RU")
    return dateFormatter.string(from: date)
  }
}

extension LocationManager: CLLocationManagerDelegate {
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        default:
            locationManager.stopUpdatingLocation()
        }
    }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       if let location = locations.last {
           let geocoder = CLGeocoder()
           geocoder.reverseGeocodeLocation(location) { placemarks, error in
               if let placemark = placemarks?.first {
                   if let city = placemark.locality {
                       self.city = city
                   }
               }
           }
       }
   }
  
}
