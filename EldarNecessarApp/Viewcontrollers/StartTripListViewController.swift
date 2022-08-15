//
//  ViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 9.08.22.
//

import UIKit

class StartTripListViewController: UIViewController {
    
    

    @IBOutlet weak var tripListTableView: UITableView!
    
    
    var arrayWithTrips: [String] = []
    var contentOfDirectory: [URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripListTableView.register(UINib(nibName: "TripTableViewCell", bundle: nil), forCellReuseIdentifier: TripTableViewCell.key)
    }
    

    
    
    @IBAction func addTrip(_ sender: Any) {
        if let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetTripViewController") as? SetTripViewController {
            VC.tripsClosure = { [ weak self ] text in
                self?.arrayWithTrips.insert(text, at: 0)
                self?.tripListTableView.reloadData()
            }
            VC.picsClosure = { [ weak self ] pics in
                self?.contentOfDirectory.insert(pics, at: 0)
                self?.tripListTableView.reloadData()
            }
            present(VC, animated: true)
        }
     
    }
    
}

