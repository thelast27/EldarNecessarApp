//
//  ItemsListVC+Extension.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 27.08.22.
//

import Foundation
import UIKit


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
        if items.isPacked == true {
            cell.checkMark.isHidden = false
        } else {
            cell.checkMark.isHidden = true
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = UIStoryboard(name: "ItemsList", bundle: nil).instantiateViewController(withIdentifier: "EditItemVC") as? EditItemViewController, let trip = trips else { return }
        vc.titleForTop = resultsRealmDataWithItem[indexPath.row].itemName
        vc.items = resultsRealmDataWithItem[indexPath.row]
        vc.trips = trip
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let items = resultsRealmDataWithItem[indexPath.row]
        let doCheckMark = UIContextualAction(style: .normal, title: "\(items.isPacked == false ? "Check" : "Uncheck")") { [weak self] (action, view, completionHandler) in
            
            guard let items = self?.resultsRealmDataWithItem[indexPath.row], let trip = self?.trips else { return }
            self?.realmManager.writeItemIsPackedDataToRealm(item: items, in: trip)
            tableView.reloadData()
            completionHandler(true)
        }
        
        doCheckMark.backgroundColor = items.isPacked == false ? .systemGreen : .systemBlue
        
        return UISwipeActionsConfiguration(actions: [doCheckMark])
    }
}







