//
//  WeatherVC.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
    static let padding: CGFloat = 10
    let locationManager         = CLLocationManager()
    let backgroundImageView     = UIImageView(image: Image.climappBG)
    let changeCityView          = CAChangeCityView()
    let weatherView             = CAWeatherView()
    let weather                 = CATitleLabel(textAlignment: .center, fontSize: 35, weight: .light, textColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureConstraint()
        configureLocationManager()
    }
    
    private func configureLocationManager() {
        locationManager.delegate            = self
        locationManager.desiredAccuracy     = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func configureVC() {
        title                                                   = "ClimApp"
        view.backgroundColor                                    = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubview(backgroundImageView)
        backgroundImageView.frame       = view.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        view.sendSubviewToBack(backgroundImageView)
        
        weather.numberOfLines = 2
    }
    
    func formatDate(dt: Double) -> String {
        let date                = NSDate(timeIntervalSince1970: dt)
        let dateFormatter       = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: date as Date)
    }
    
    func updateUI(weatherData: WeatherData) {
        DispatchQueue.main.async {
            if let temperature = weatherData.main["temp"] {
                self.weatherView.temp.text              = "\(Int(temperature - 273.15))º"
                self.weather.text                       = weatherData.weather[0].description
                self.changeCityView.cityNameLabel.text  = weatherData.name
                self.changeCityView.dateLabel.text      = self.formatDate(dt: weatherData.dt)
                self.weatherView.imageView.image        = weatherData.updateWeatherIcon(id: weatherData.weather[0].id)
                
                let maxTemp                         = Int(weatherData.main["temp_max"]!   - 273.15)
                let minTemp                         = Int(weatherData.main["temp_min"]!   - 273.15)
                let feelsLikeTemp                   = Int(weatherData.main["feels_like"]! - 273.15)
                
                self.weatherView.feelLikeTemp.text  = "\(maxTemp)º / \(minTemp)º feels like \(feelsLikeTemp)º"
            }
        }
    }
    
    
    @objc func goToChangeCityVC() {
        DispatchQueue.main.async {
            let changeCityVC = ChangeCityVC()
            changeCityVC.modalPresentationStyle = .pageSheet
            changeCityVC.modalTransitionStyle   = .coverVertical
            changeCityVC.delegate               = self
            self.present(changeCityVC, animated: true)
        }
    }
    
    
    // MARK: - CHANGECITY DELEGATE METHODS
    func newEntered(city name: String, coord: [String : String]?) {
        NetworkManager.shared.getWeather(city: name, coord: coord) { result in
            switch result {
            case .failure(let error):
                self.presentCAAlertOnMainThread(title: "Bad thing happened", message: "\(error.rawValue)", titleButton: "Ok")
            case .success(let weatherData):
                self.updateUI(weatherData: weatherData)
            }
        }
    }
    
    // MARK: - LOCATION MANAGER METHODS
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        presentCAAlertOnMainThread(title: "Bad thing happened", message: error.localizedDescription, titleButton: "Ok")
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        
//        let dateFormatter                   = DateFormatter()
//        let cityName                        = dateFormatter.timeZone.identifier.split(separator: "/")[1].split(separator: "_").joined(separator:  " ")
//        changeCityView.cityNameLabel.text   = cityName
        
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            let coord = [
                "lat" : String(location.coordinate.latitude),
                "lon" : String(location.coordinate.longitude)
            ]
            self.newEntered(city: "", coord: coord)
        }
    }
}

