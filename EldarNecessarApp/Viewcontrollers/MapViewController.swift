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
    @IBOutlet weak var viewForBackground: UIImageView!
    
    typealias SetGeoIngo = ([Double]) -> Void
    private var realmManager = RealmManager()
    private var trips: Trips!
    var long: Double = 0.0
    var lat: Double = 0.0
    var id: ObjectId!
    var geoClosure: SetGeoIngo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForBackground.image = UIImage(named: "backgroundPic")
        viewForMap.layer.cornerRadius = 5
        viewForMap.clipsToBounds = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeScreen))
        
        let camera = GMSCameraPosition.camera(withLatitude: 54.029, longitude: 27.597, zoom: 5.0)
        let mapView = GMSMapView.map(withFrame: self.viewForMap.bounds, camera: camera)
        mapView.delegate = self
        self.viewForMap.addSubview(mapView)
        trips = realmManager.realm.object(ofType: Trips.self, forPrimaryKey: id)
    }
    
    @objc func closeScreen() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func savePlaceForTRip(_ sender: Any) {
        realmManager.addMarkerToRealm(lat: lat, long: long, in: trips) {
            geoClosure?([lat, long])
            navigationController?.popViewController(animated: true)
        }
    }
}

