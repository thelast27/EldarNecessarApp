//
//  ViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 9.08.22.
//

import UIKit
import RealmSwift

class StartTripListViewController: UIViewController {

    
    @IBOutlet weak var tripListTableView: UITableView!
    
    let realm = try! Realm()
    
    var arrayWithTrips: [String] = []
    var contentOfDirectory: [URL] = []
    var resultsRealmData: Results<Trips>!
    var realmManager = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Trips list"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTripAction))
        tripListTableView.register(UINib(nibName: "TripTableViewCell", bundle: nil), forCellReuseIdentifier: TripTableViewCell.key)
        resultsRealmData = realmManager.getTripDataFromRealm()
    }

        
        @objc func addTripAction(_ sender: Any) {
            if let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetTripViewController") as? SetTripViewController {
                VC.tripsClosure = { [ weak self ] text in
                    self?.tripListTableView.reloadData()
                }
                VC.picsClosure = { [ weak self ] pics in
                    self?.contentOfDirectory.insert(pics, at: 0)
                    self?.tripListTableView.reloadData()
                }
                navigationController?.present(VC, animated: true)
        }
    }
    
}

