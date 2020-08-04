//
//  WeatherDataModel.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct WeatherData: Codable {
    var name:       String
    var main:       [String : Double]
    var coord:      [String : Double]
    var weather:    [Weather]
    
    
    func updateWeatherIcon(id: Int) -> UIImage {
        switch id {
        case 0...300:
            return Image.tstorm1
        case 301...500:
            return Image.light_rain
        case 501...600:
            return Image.shower3
        case 601...700:
            return Image.snow4
        case 701...771:
            return Image.fog
        case 772...799, 900...902, 905...1000:
            return Image.tstorm3
        case 800, 904:
            return Image.sunny
        case 801...804:
            return Image.cloudy2
        case 903:
            return Image.snow5
        default:
            return Image.dunno
        }
    }
}
