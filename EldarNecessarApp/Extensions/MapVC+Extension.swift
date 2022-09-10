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
        
        if lat == 0.0 && long == 0.0 {
            marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
            marker.map = mapView
            tripPlaceSelected.isEnabled = true
            lat = coordinate.latitude
            long = coordinate.longitude
        } else {
            let alertController = UIAlertController(title: "Attention!", message: "Coordinates are already set. Set new?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] alert in
                mapView.clear()
                marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
                marker.map = mapView
                self?.tripPlaceSelected.isEnabled = true
                self?.lat = coordinate.latitude
                self?.long = coordinate.longitude
            }))
            alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: { [weak self] alert in
                self?.dismiss(animated: true)
            }))
           present(alertController, animated: true)
        }
      

    }
}
