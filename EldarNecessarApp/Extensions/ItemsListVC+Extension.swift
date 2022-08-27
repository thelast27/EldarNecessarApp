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
        let items = resultsRealmDataWithItem[indexPath.row]
        realmManager.writeItemIsPackedDataToRealm(item: items, in: trips)
        tableView.reloadData()
        
    }
   
}
