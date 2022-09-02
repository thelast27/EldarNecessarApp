//
//  MapViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 30.08.22.
//

import UIKit
import GoogleMaps
import RealmSwift

class MapViewController: UIViewController {
    
    @IBOutlet weak var viewForMap: UIView!
    @IBOutlet weak var tripPlaceSelected: UIButton!
    
    private var realmManager = RealmManager()
    var trips: Trips!
    var long: Double = 0.0
    var lat: Double = 0.0
    var id: ObjectId!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeScreen))
        
        let camera = GMSCameraPosition.camera(withLatitude: 54.029, longitude: 27.597, zoom: 5.0)
        let mapView = GMSMapView.map(withFrame: self.viewForMap.frame, camera: camera)
        mapView.delegate = self
        self.viewForMap.addSubview(mapView)
        trips = realmManager.realm.object(ofType: Trips.self, forPrimaryKey: id)
    }
    
    @objc func closeScreen() {
        dismiss(animated: true)
    }
    @IBAction func savePlaceForTRip(_ sender: Any) {
        realmManager.addMarkerToRealm(lat: lat, long: long, in: trips) {
            dismiss(animated: true)
        }
    }
}

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
