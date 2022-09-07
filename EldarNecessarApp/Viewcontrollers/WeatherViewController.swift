//
//  WeatherViewController.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 5.09.22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    var lat: Double = 0.0
    var long: Double = 0.0
    var currentAndForecustedWeather: CurrentAndForecastWeather?
    private var weatherManagerDelegte: RestAPIProviderProtocol = WeatherManager()
    var dailyWeather: [DailyWeatherData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableView.register(UINib(nibName: "CurrentWeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrentWeatherCell")
        weatherTableView.register(UINib(nibName: "DailyTableViewCell", bundle: nil), forCellReuseIdentifier: "DailyWeather")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        weatherManagerDelegte.getWeatherForCityCoordinates(long: long, lat: lat, withLang: .english, withUnitsOfmeasurement: .celsius) { [weak self] weatherData in
            guard let self = self else { return }
            self.currentAndForecustedWeather = weatherData
            self.dailyWeather = weatherData.daily
            DispatchQueue.main.async {
                self.weatherTableView.reloadData()
            }
        }
    }
    
}

