//
//  WeatherManager.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 5.09.22.
//

import Foundation

enum Units {
    case celsius
    var main: String {
        switch self {
        case .celsius: return "metric"
        }
    }
}

protocol APIProviderProtocol {
    func getWeatherForCityCoordinates(long: Double, lat: Double, withUnitsOfmeasurement units: Units, completionHandler: @escaping (CurrentAndForecastWeather) -> Void)
}

class WeatherManager: APIProviderProtocol {
    
    var weatherApiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "weatherApiKey") as? String else { return "" }
        return key
    }
    
    func getWeatherForCityCoordinates(long: Double, lat: Double, withUnitsOfmeasurement units: Units, completionHandler: @escaping (CurrentAndForecastWeather) -> Void) {
        let endpoint = Endpoint.currentWeather(lat: lat, lon: long, key: weatherApiKey, units: units.main)
        var urlRequest = URLRequest(url: endpoint.url )
        urlRequest.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error)
            }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let currentWeather = try decoder.decode(CurrentAndForecastWeather.self, from: data)
                    completionHandler(currentWeather)
                } catch let error {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
    
}


