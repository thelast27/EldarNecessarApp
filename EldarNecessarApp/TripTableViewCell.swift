//
//  TripTableViewCell.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 9.08.22.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var tripName: UILabel!
    
    
    static var key = "TripTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tripName.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
