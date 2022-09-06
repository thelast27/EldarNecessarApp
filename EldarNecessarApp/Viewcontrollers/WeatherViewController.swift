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
    var weatherManagerDelegte: RestAPIProviderProtocol = WeatherManager()
    var dailyWeather: [DailyWeatherData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableView.register(UINib(nibName: "CurrentWeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrentWeatherCell")
        weatherTableView.register(UINib(nibName: "DailyTableViewCell", bundle: nil), forCellReuseIdentifier: "DailyWeather")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        weatherManagerDelegte.getCoordinatesByName(forCity: "Dublin") { [weak self] weatherData in
            guard let self = self else { return }
            self.currentAndForecustedWeather = weatherData
            self.dailyWeather = weatherData.daily
            DispatchQueue.main.async {
                self.weatherTableView.reloadData()
            }
        }
    }
    
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return dailyWeather?.count ?? 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentWeatherCell", for: indexPath) as? CurrentWeatherTableViewCell else { return UITableViewCell() }
            if let current = currentAndForecustedWeather {
                cell.update(date: current)
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyWeather", for: indexPath) as? DailyTableViewCell else { return UITableViewCell() }
            if let daily = dailyWeather {
                cell.update(date: daily[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        } else {
            return 70
        }
    }
}
