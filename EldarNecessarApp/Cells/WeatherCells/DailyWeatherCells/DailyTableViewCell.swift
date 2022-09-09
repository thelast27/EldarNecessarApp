//
//  DailyTableViewCell.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 5.09.22.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func update(date: DailyWeatherData) {
        guard let dt = date.dt, let temp = date.temp?.day, let icon = date.weather?.first?.icon else { return }
        weatherImage.getImageFromTheInternet(icon)
        dayLabel.text = dt.updateDateFormat(dateFormat: .fullTime)
        tempLabel.text = "\(Int(temp)) °C"
        
    }
    
}
