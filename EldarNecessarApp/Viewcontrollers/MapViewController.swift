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

        let camera = GMSCameraPosition.camera(withLatitude: 54.029, longitude: 27.597, zoom: 5.0)
        let mapView = GMSMapView.map(withFrame: viewForMap.bounds, camera: camera)
        mapView.delegate = self
        viewForMap.addSubview(mapView)
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
