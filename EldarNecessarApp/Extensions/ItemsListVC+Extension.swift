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
        
        guard let vc = UIStoryboard(name: "ItemsList", bundle: nil).instantiateViewController(withIdentifier: "EditItemVC") as? EditItemViewController else { return }
                    vc.titleForTop = resultsRealmDataWithItem[indexPath.row].itemName
        vc.items = resultsRealmDataWithItem[indexPath.row]
        vc.trips = trips
                    navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let items = resultsRealmDataWithItem[indexPath.row]
        if items.isPacked == false {
            let doCheckMark = UIContextualAction(style: .normal, title: "Check") { [weak self] (action, view, completionHandler) in
                
                guard let items = self?.resultsRealmDataWithItem[indexPath.row] else { return }
                self?.realmManager.writeItemIsPackedDataToRealm(item: items, in: self?.trips ?? Trips.init())
                tableView.reloadData()
                completionHandler(true)
            }
            doCheckMark.backgroundColor = .systemGreen
            
            return UISwipeActionsConfiguration(actions: [doCheckMark])
            
        } else {
            let doUnCheckMark = UIContextualAction(style: .normal,  title: "Unheck") { [weak self] (action, view, completionHandler) in
                
                guard let items = self?.resultsRealmDataWithItem[indexPath.row] else { return }
                self?.realmManager.writeItemIsPackedDataToRealm(item: items, in: self?.trips ?? Trips.init())
                tableView.reloadData()
                completionHandler(true)
            }
            doUnCheckMark.backgroundColor = .systemBlue
            
            return UISwipeActionsConfiguration(actions: [doUnCheckMark])  }
    }
}







