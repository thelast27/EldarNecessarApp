//
//  APIManager.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 5.09.22.
//

import Foundation

enum Endpoint {
    case getIcon(icon: String)
    case currentWeather(lat: Double, lon: Double, key: String, units: String)
}

extension Endpoint {
    var weatherURL: String {
        return "https://api.openweathermap.org/"
    }
    
    var iconURL: String {
        return "https://openweathermap.org/"
    }
    
    var url: URL {
        switch self {
            
            case .getIcon(let icon):
            if let url = URL(string: iconURL.appending("img/wn/\(icon)@2x.png")) {
                return url
            }
            fatalError()
            
        case .currentWeather(let lat, let lon, let key, let units):
            if let url = URL(string: weatherURL.appending("data/2.5/onecall?lat=\(lat)&lon=\(lon)&appid=\(key)&units=\(units)")) {
                return url
            }
            fatalError()
        }
    }
    
    
}

