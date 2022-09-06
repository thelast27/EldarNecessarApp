//
//  CurrentWeatherTableViewCell.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 5.09.22.
//

import UIKit

class CurrentWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var currentWeather: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func update(date: CurrentAndForecastWeather) {
        DispatchQueue.main.async {
            guard let temp = date.current?.temp,
                  let cityName = date.timeZone,
                  let description = date.current?.weather?.first?.description
            else { return }
            self.locationName.text = cityName
            self.currentWeather.text = "\(Int(temp)) °"
            self.weatherDescription.text = "Now \(description)"
        }
        
        
        
    }
}
