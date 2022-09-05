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
    var weatherManagerDelegte: APIProviderProtocol = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.register(UINib(nibName: "CurrentWeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrentWeatherCell")
        
        weatherManagerDelegte.getWeatherForCityCoordinates(long: long, lat: lat, withUnitsOfmeasurement: .celsius) { [weak self] weatherData in
            guard let self = self else { return }
            self.currentAndForecustedWeather = weatherData
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
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentWeatherCell", for: indexPath) as? CurrentWeatherTableViewCell else { return UITableViewCell() }
        if let current = currentAndForecustedWeather {
            cell.update(date: current)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
 
    
    
}
