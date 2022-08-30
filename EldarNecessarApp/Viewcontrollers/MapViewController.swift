//
//  MapViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 30.08.22.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var viewForMap: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
                let mapView = GMSMapView.map(withFrame: self.viewForMap.frame, camera: camera)
                self.viewForMap.addSubview(mapView)

                // Creates a marker in the center of the map.
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
                marker.title = "Sydney"
                marker.snippet = "Australia"
                marker.map = mapView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MapViewController: GMSMapViewDelegate {
    
}
