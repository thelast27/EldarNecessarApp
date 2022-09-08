//
//  Int+Extension.swift
//  EldarNecessarApp
//
//  Created by Eldar Garbuzov on 6.09.22.
//

import Foundation
import UIKit


extension Int {
    func updateDateFormat(dateFormat: DateFormat) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = dateFormat.getDateFormat
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
}

enum DateFormat: String {
    case hours
    case days
    case fullTime
    case daysWithoutYear
    
    var getDateFormat: String {
        switch self {
        case .hours: return "HH"
        case .days: return "E"
        case .daysWithoutYear: return "HH MMMM yyyy"
        case .fullTime: return "EEEE, MMM d, yyyy"
        }
    }
}
