//
//  ChangeCityVC.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit

class ChangeCityVC: UIViewController, UITextFieldDelegate {
    
    let backgroundImageView = UIImageView(image: Image.climappBG2)
    let textField           = CATextField()
    let getWeatherButton    = CAButton(backgroundColor: .clear, title: "Get weather", borderColor: nil)
    let closeButton         = CAButton(type: .close)

    var delegate: WeatherVC?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraint()
        createKeyboardDismiss()
        configureGetWeatherButton()
        configureTextField()
        configureCloseButton()
    }

    
    var isCityEntered: Bool {
        get { !self.textField.text!.isEmpty }
    }
    
    func configureCloseButton() {
        closeButton.addTarget(self, action: #selector(backToWV), for: .touchUpInside)
    }

    
    private func createKeyboardDismiss() {
        let tab = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        self.view.addGestureRecognizer(tab)
    }
    
    private func configureTextField() {
        self.textField.delegate = self
        self.textField.returnKeyType = .go
    }
    
    private func configureGetWeatherButton() {
        getWeatherButton.addTarget(self, action: #selector(backToWeatherVC), for: .touchUpInside)
    }
    
    @objc func backToWV() {
        dismiss(animated: true)
    }
    
    @objc func backToWeatherVC () {
        guard isCityEntered else {
            presentCAAlertOnMainThread(title: "Empty field", message: "Please type a new city to search the weather. 😅", titleButton: "Ok")
            return
        }
        dismissVC()
    }
    
    func dismissVC () {
        dismiss(animated: true) { self.delegate?.newEntered(city: self.textField.text!, coord: nil) }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        backToWeatherVC()
        return true
    }
}
