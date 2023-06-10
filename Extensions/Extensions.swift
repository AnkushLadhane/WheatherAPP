//
//  Extensions.swift
//  DemoWeatherApp
//
//  Created by Ankush Ladhane on 09/04/23.
//

import Foundation
import UIKit

public enum CustomError: Error, CustomStringConvertible {
    case unknownError
    case errorWithDesc(Error)
    
    public var description: String {
        switch self {
        case .unknownError:
            return "Unknown error"
        case .errorWithDesc(let error):
            return error.localizedDescription
        }
    }
}

//extension Double {
//    func calculateCelsius(fahrenheit: Double) -> Double {
//        var celsius: Double
//        celsius = (fahrenheit - 32) * 5 / 9
//        return celsius
//    }
//
//    func calculateFahrenheit(celsius: Double) -> Double {
//        var fahrenheit: Double
//        fahrenheit = celsius * 9 / 5 + 32
//        return fahrenheit
//    }
//}


extension String {
    func unixToDate(ts: Int) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(ts))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MMM dd YYYY hh:mm a"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
}
