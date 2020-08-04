//
//  CAAlertVC.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit

class CAAlertVC: UIViewController {

    let containerView   = UIView()
    let titleLabel      = CATitleLabel(textAlignment: .center, fontSize: 20, weight: .bold, textColor: .label)
    let messageLabel    = CABodyLabel(textAlignment: .center)
    let actionButton    = CAButton(backgroundColor: .systemGreen, title: "Ok", borderColor: .clear)
    
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle     = title
        self.message        = message
        self.buttonTitle    = buttonTitle
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureBodyLabel()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        
        containerView.backgroundColor       = .systemBackground
        containerView.layer.cornerRadius    = 16
        containerView.layer.borderWidth     = 2
        containerView.layer.borderColor     = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: WeatherVC.padding * 2),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: WeatherVC.padding * 2),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -(WeatherVC.padding * 2)),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -(WeatherVC.padding * 2)),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: WeatherVC.padding * 2),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -(WeatherVC.padding * 2)),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureBodyLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text           = message ?? "unable to complete request"
        messageLabel.numberOfLines  = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: WeatherVC.padding * 2),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -(WeatherVC.padding * 2)),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc func dismissVC () {
        dismiss(animated: true)
    }

}
