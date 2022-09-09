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
    @IBOutlet weak var backgroundPic: UIImageView!
    
    
    var resultsRealmData: Results<Trips>!
    var realmManager = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundPic.image = UIImage(named: "backgroundPic")

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
            navigationController?.present(VC, animated: true)
        }
    }
    
}

