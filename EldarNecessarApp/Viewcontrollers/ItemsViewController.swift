//
//  ItemsViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 16.08.22.
//

import UIKit
import RealmSwift

class ItemsViewController: UIViewController {
    
    @IBOutlet weak var itemListTableView: UITableView!
    @IBOutlet weak var viewForBackground: UIImageView!
    
    typealias SendTripsID = (Trips) -> Void
    
    var resultsRealmDataWithItem: List<ItemsForTrip>!
    var trips: Trips?
    var realmManager = RealmManager()
    var id: ObjectId!
    var sendTripsIdClosure: SendTripsID?
    var items: ItemsForTrip!
    var lat: Double = 0.0
    var long: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForBackground.image = UIImage(named: "backgroundPic")
        trips = realmManager.realm.object(ofType: Trips.self, forPrimaryKey: id)
        guard let trip = trips else { return }
        sendTripsIdClosure?(trip)
        resultsRealmDataWithItem = trip.items
        itemListTableView.reloadData()
        
        itemListTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ItemTableViewCell.key)
        
        itemListTableView.reloadData()
    
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        guard let trip = trips else { return }
        if trip.coordinatesAvailable {
            navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "map"), style: .done, target: self, action: #selector(showMap)),
                                                  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAction)),
                                                  UIBarButtonItem(image: UIImage(systemName: "cloud.sun.rain.fill"), style: .done, target: self, action: #selector(showWeather))]
        } else {
            navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "map"), style: .done, target: self, action: #selector(showMap)),
                                                  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAction))]
        }
        itemListTableView.reloadData()
    }
    
    @objc func addItemAction(_ sender: Any) {
        guard let vc = UIStoryboard(name: "ItemsList", bundle: nil).instantiateViewController(withIdentifier: "SetItemVC") as? SetItemViewController, let trip = trips else { return }
        vc.itemsClosure = { [ weak self ] items in
            self?.itemListTableView.reloadData()
        }
        vc.trips = trip
        
        let navigationVC = UINavigationController(rootViewController: vc)
        present(navigationVC, animated: true)
    }
    
    @objc func showMap(_ sender: Any) {
        
        guard let vc = UIStoryboard(name: "MapStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as? MapViewController else { return }
        vc.geoClosure = { [weak self] geoData in
            self?.lat = vc.lat
            self?.long = vc.long
        }
        vc.id = id
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showWeather (_ sender: Any) {
        guard let vc = UIStoryboard(name: "WeatherStoryboard", bundle: nil).instantiateViewController(withIdentifier: "WeatherVC") as? WeatherViewController else { return }
        vc.lat = lat
        vc.long = long
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


