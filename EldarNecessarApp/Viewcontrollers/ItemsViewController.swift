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
    private var trips: Trips!
    private var realmManager = RealmManager()
    var id: ObjectId!
    var sendTripsIdClosure: SendTripsID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.title = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAction))
        itemListTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ItemTableViewCell.key)
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        trips = realmManager.realm.object(ofType: Trips.self, forPrimaryKey: id)
        sendTripsIdClosure?(trips)
        resultsRealmDataWithItem = trips.items
        
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
    
}


extension ItemsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsRealmDataWithItem.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.key, for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        let items = resultsRealmDataWithItem[indexPath.row]
        cell.itemName.text = items.itemName
        cell.itemDescription.text = items.itemDescription
        cell.itemQty.text = "\(items.itemQty)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
