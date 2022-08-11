//
//  TripListVC + Extension.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 9.08.22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: TripTableViewCell.key, for: indexPath) as? TripTableViewCell {
            cell.tripName.text = tripsArray[indexPath.row]
            cell.tripPhoto.image = UIImage(contentsOfFile: (contentOfDerectory?[indexPath.row].path) ?? "person") // если элементов (строк в данном случае) больше, чем картинок для них, то выскакивает ошибка Thread 1: Fatal error: Index out of range
            return cell
        }
        return UITableViewCell()
    }
    
    
}
