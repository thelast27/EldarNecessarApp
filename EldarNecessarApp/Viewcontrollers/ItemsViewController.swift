//
//  ItemsViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 16.08.22.
//

import UIKit
import RealmSwift

class ItemsViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var itemListTableView: UITableView!
    var arrayWithItems: [String] = []
    var otherItemDetails: [String]?
    var resultsRealmDataWithItem: Results<ItemsForTrip>!
    var realmManager = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAction))
        itemListTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ItemTableViewCell.key)
        resultsRealmDataWithItem = realmManager.getItemDataFromRealm()
        itemListTableView.reloadData()
    }
    
    
    @objc func addItemAction(_ sender: Any) {
        guard let vc = UIStoryboard(name: "ItemsList", bundle: nil).instantiateViewController(withIdentifier: "SetItemVC") as? SetItemViewController else { return }
            vc.itemsClosure = { [ weak self ] items in
//                self?.arrayWithItems.insert(items, at: 0)
                self?.itemListTableView.reloadData()
            }
            vc.itemsDetailsClosure = { [ weak self ] details in
                self?.otherItemDetails = details
                self?.itemListTableView.reloadData()
            }
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
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let viewController = UIStoryboard(name: "ItemsList", bundle: nil)
    //        if let VC = viewController.instantiateViewController(withIdentifier: "SetItemVC") as? SetItemViewController {
    //            VC.itemsClosure = { [ weak self ] items in
    //                self?.arrayWithItems = items
    //                self?.itemListTableView.reloadData()
    //            }
    //            let navigationVC = UINavigationController(rootViewController: VC)
    //            present(navigationVC, animated: true)
    //        }
    //
    //}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
}
