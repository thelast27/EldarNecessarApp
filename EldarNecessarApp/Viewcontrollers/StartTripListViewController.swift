//
//  ViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 9.08.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tripListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripListTableView.register(UINib(nibName: "TripTableViewCell", bundle: nil), forCellReuseIdentifier: TripTableViewCell.key)

    }

    @IBAction func addTrip(_ sender: Any) {
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetTripViewController")
        present(VC, animated: true)
        tripListTableView.reloadData()
    }
    
}

