//
//  Extension.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit


// MARK: - EXTENSION FOR UIVIEWCONTROLLERS
extension UIViewController {
    // PRESENT CAALERT ON MAIN THREAD
    func presentCAAlertOnMainThread(title: String, message: String, titleButton: String) {
        DispatchQueue.main.async {
            let alertVC = CAAlertVC(title: title, message: message, buttonTitle: titleButton)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}

// MARK: - EXTENSION FOR WEATHER VIEWCONTROLLER
extension WeatherVC {
    // CONSTRAINS
    func configureConstraint() {
        view.addSubview(changeCityView)
        view.addSubview(weatherView)
        view.addSubview(weather)
        
        NSLayoutConstraint.activate([
            changeCityView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: WeatherVC.padding),
            changeCityView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: WeatherVC.padding),
            changeCityView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -WeatherVC.padding),
            changeCityView.heightAnchor.constraint(equalToConstant: 60),
            
            weatherView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(WeatherVC.padding * 4)),
            weatherView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: WeatherVC.padding),
            weatherView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -WeatherVC.padding),
            weatherView.heightAnchor.constraint(equalToConstant: 250),
            
            weather.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: WeatherVC.padding * 3),
            weather.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: WeatherVC.padding * 2),
            weather.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -WeatherVC.padding * 2)
            
        ])
        changeCityView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToChangeCityVC)))
    }
}



// MARK: - EXTENSION FOR CHANGECITY VIEWCONTROLLER
extension ChangeCityVC {
    // CONSTRAINTS
    func configureConstraint() {
        view.backgroundColor = .systemBackground
        view.addSubview(backgroundImageView)
        view.addSubview(textField)
        view.addSubview(getWeatherButton)
        view.addSubview(closeButton)
        
        backgroundImageView.frame       = view.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        view.sendSubviewToBack(backgroundImageView)
        
        getWeatherButton.translatesAutoresizingMaskIntoConstraints  = false
        closeButton.translatesAutoresizingMaskIntoConstraints       = false
        
        closeButton.backgroundColor     = .clear
        closeButton.layer.borderColor   = UIColor.white.cgColor

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: WeatherVC.padding * 12),
            textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 270),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            getWeatherButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: WeatherVC.padding * 2),
            getWeatherButton.centerXAnchor.constraint(equalTo: textField.centerXAnchor),
            getWeatherButton.widthAnchor.constraint(equalTo: textField.widthAnchor),
            getWeatherButton.heightAnchor.constraint(equalTo: textField.heightAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: WeatherVC.padding * 2),
            closeButton.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -(WeatherVC.padding * 2)),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor)
        ])
    }
}
