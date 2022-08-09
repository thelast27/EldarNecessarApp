//
//  TripListViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 9.08.22.
//

import UIKit

class TripListViewController: UIViewController {

    @IBOutlet weak var tripListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tripListTableView.register(UINib(nibName: "TripTableViewCell", bundle: nil), forCellReuseIdentifier: "TripTableViewCell")

 
    }
    
    @IBAction func addNewTrip(_ sender: Any) {
    
        tripListTableView.reloadData()
    }
    

}
