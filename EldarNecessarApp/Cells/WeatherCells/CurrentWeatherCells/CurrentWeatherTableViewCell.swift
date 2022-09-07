//
//  CurrentWeatherTableViewCell.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 5.09.22.
//

import UIKit

class CurrentWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currentWeather: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var viewForImage: UIImageView!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var mainDescription: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var dewPoint: UILabel!
    @IBOutlet weak var sunIndex: UILabel!
    @IBOutlet weak var vsibility: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func update(date: CurrentAndForecastWeather) {
        DispatchQueue.main.async {
            guard let temp = date.current?.temp,
                  let description = date.current?.weather?.first?.description,
                  let icon = date.current?.weather?.first?.icon,
                  let mainDescription = date.current?.weather?.first?.main,
                  let feelsLike = date.current?.feelsLike,
                  let windSpeed = date.current?.windSpeed,
                  let humidity = date.current?.humidity,
                  let dewPoint = date.current?.dewPoint,
                  let sunIndex = date.current?.uvi,
                  let visibility = date.current?.visibility
            else { return }
            
            self.viewForImage.getImageFromTheInternet(icon)
            self.currentWeather.text = "\(Int(temp)) °C"
            self.weatherDescription.text = "Now \(description)"
            self.feelsLike.text = "Feels like \(Int(feelsLike))°C"
            self.mainDescription.text = "\(mainDescription)"
            self.windSpeed.text = "Wind speed is \(windSpeed) m/s"
            self.humidity.text = "Humidity is \(humidity) %"
            self.dewPoint.text = "Dew point is \(dewPoint)°C"
            self.sunIndex.text = "UVI is \(Int(sunIndex))"
            self.vsibility.text = "Vsibility is \(visibility / 1000) km"
        }
        
    }
}
