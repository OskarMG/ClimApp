//
//  CAChangeCityView.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit

class CAChangeCityView: UIView {
    
    let iconImageView   = UIImageView(image: Image.locationIcon)
    let cityNameLabel   = CATitleLabel(textAlignment: .right, fontSize: 20, weight: .light, textColor: .white)
    let dateLabel       = CATitleLabel(textAlignment: .right, fontSize: 16, weight: .light, textColor: .white)
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        let padding: CGFloat                        = 10
        translatesAutoresizingMaskIntoConstraints   = false
        
        addSubview(iconImageView)
        addSubview(cityNameLabel)
        addSubview(dateLabel)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints     = false
        
        
        iconImageView.contentMode = .scaleAspectFit
        
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            iconImageView.widthAnchor.constraint(equalToConstant: 32),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            
            cityNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(padding + 2)),
            cityNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            cityNameLabel.trailingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: -padding),
            
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: padding + 2),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: -padding)
        ])
        
        
        cityNameLabel.text  = "City"
        dateLabel.text      = "Day 0 Month 0:00 period"
        
    }
}
