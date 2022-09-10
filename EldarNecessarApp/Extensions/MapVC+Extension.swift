//
//  MapVC+Extension.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 10.09.22.
//

import Foundation
import UIKit
import GoogleMaps

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.map = mapView
        tripPlaceSelected.isEnabled = true
        lat = coordinate.latitude
        long = coordinate.longitude

    }
}
