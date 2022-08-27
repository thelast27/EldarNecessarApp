//
//  TripTableViewCell.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 9.08.22.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var tripNotes: UILabel!
    @IBOutlet weak var tripPhoto: UIImageView!
    
    
    static var key = "TripTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tripName.text = ""
        tripNotes.text = ""
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
