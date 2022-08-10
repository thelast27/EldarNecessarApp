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
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "tableViewChanged"), object: nil)

    }
    
    @objc fileprivate func refresh() {
       self.tripListTableView.reloadData()
   }
    
    @IBAction func addTrip(_ sender: Any) {
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetTripViewController")
        present(VC, animated: true)
    }
    
}

