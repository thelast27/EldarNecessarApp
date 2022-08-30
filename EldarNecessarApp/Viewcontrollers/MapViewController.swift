//
//  MapViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 30.08.22.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    private var realmManager = RealmManager()
    var trips = Trips()
    
    
    @IBOutlet weak var viewForMap: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.viewForMap.frame, camera: camera)
        self.viewForMap.addSubview(mapView)
        
        let title = trips.tripName
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
        marker.title = title
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
    

    
}

extension MapViewController: GMSMapViewDelegate {
    
}
