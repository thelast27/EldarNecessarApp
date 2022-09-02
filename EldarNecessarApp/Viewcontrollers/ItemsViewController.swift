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
    
    typealias SendTripsID = (Trips) -> Void
    
    var resultsRealmDataWithItem: List<ItemsForTrip>!
    var trips: Trips!
    var realmManager = RealmManager()
    var id: ObjectId!
    var sendTripsIdClosure: SendTripsID?
    var items: ItemsForTrip!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.title = ""

        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "map"), style: .done, target: self, action: #selector(showMap)),
                                              UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAction))]
        
        itemListTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ItemTableViewCell.key)
        
        trips = realmManager.realm.object(ofType: Trips.self, forPrimaryKey: id)
        sendTripsIdClosure?(trips)
        resultsRealmDataWithItem = trips.items
        
        itemListTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemListTableView.reloadData()
    }
    
    @objc func addItemAction(_ sender: Any) {
        guard let vc = UIStoryboard(name: "ItemsList", bundle: nil).instantiateViewController(withIdentifier: "SetItemVC") as? SetItemViewController else { return }
        vc.itemsClosure = { [ weak self ] items in
            self?.itemListTableView.reloadData()
        }
        vc.trips = trips
        
        let navigationVC = UINavigationController(rootViewController: vc)
        present(navigationVC, animated: true)
    }
    
    @objc func showMap(_ sender: Any) {
        guard let vc = UIStoryboard(name: "MapStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as? MapViewController else { return }
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.id = id
        present(navigationVC, animated: true)
    }
    
}


