//
//  ItemTableViewCell.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 16.08.22.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemQty: UILabel!
    @IBOutlet weak var checkMark: UIImageView!
    
    static var key = "ItemTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkMark.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateLabels(date: [String]) {
        if !(itemDescription.text == nil) && !(itemQty.text == nil) {
            itemDescription.text = date[0]
            itemQty.text = date[1]
        } else {
            itemDescription.text = date[0]
        }
        
    }
    
}
