//
//  NetworkManager.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit


class NetworkManager {
    static let shared   = NetworkManager()
    let baseURL         = "http://api.openweathermap.org/data/2.5/weather"
    let appid           = "805888e268f5c5a38ef6caeba47c96b3"
    
    init() {}
    
    func getWeather(city name: String, completed: @escaping (Result<WeatherData, CAError>) -> Void) {
        
        var endPoint: String { return baseURL + "?q=\(name)&appid=\(appid)" }
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidCityName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in            
            if let _ = error { completed(.failure(.unableToComplete)) }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let weatherData = try decoder.decode(WeatherData.self, from: data)
                completed(.success(weatherData))
            } catch { completed(.failure(.invalidData)) }
            
        }
        
        task.resume()
    }
}
