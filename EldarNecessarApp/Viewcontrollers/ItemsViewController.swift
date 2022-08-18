//
//  ItemsViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 16.08.22.
//

import UIKit

class ItemsViewController: UIViewController {
    
    
    @IBOutlet weak var itemListTableView: UITableView!
    var arrayWithItems: [String] = []
    var otherItemDetails: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAction))
        itemListTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ItemTableViewCell.key)
    }
    
    
    @objc func addItemAction(_ sender: Any) {
        let viewController = UIStoryboard(name: "ItemsList", bundle: nil)
        if let VC = viewController.instantiateViewController(withIdentifier: "SetItemVC") as? SetItemViewController {
            VC.itemsClosure = { [ weak self ] items in
                self?.arrayWithItems.insert(items, at: 0)
                self?.itemListTableView.reloadData()
            }
            VC.itemsDetailsClosure = { [ weak self ] details in
                self?.otherItemDetails = details
                self?.itemListTableView.reloadData()
            }
            let navigationVC = UINavigationController(rootViewController: VC)
            present(navigationVC, animated: true)
        }
        
    }
}

extension ItemsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWithItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.key, for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        if let details = otherItemDetails {
            cell.itemName.text = arrayWithItems[indexPath.row]
            cell.updateLabels(date: details)
            return cell
        }
        return UITableViewCell()
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
}
