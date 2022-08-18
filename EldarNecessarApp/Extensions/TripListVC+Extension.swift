//
//  TripListVC + Extension.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 9.08.22.
//

import Foundation
import UIKit

extension StartTripListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWithTrips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: TripTableViewCell.key, for: indexPath) as? TripTableViewCell {
            cell.tripName.text = arrayWithTrips[indexPath.row]
            cell.tripPhoto.image = UIImage(contentsOfFile: (contentOfDirectory[indexPath.row].path)) // если пытаюсь загрузить просто текст, без фото - ошибка Thread 1: Fatal error: Index out of range
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = UIStoryboard(name: "ItemsList", bundle: nil).instantiateViewController(withIdentifier: "ItemsVC") as? ItemsViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
