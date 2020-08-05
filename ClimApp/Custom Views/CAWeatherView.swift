//
//  CAWeatherView.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit

class CAWeatherView: UIView {
    
    let imageView    = UIImageView()
    let temp         = CATitleLabel(textAlignment: .center, fontSize: 85, weight: .regular, textColor: .white)
    let feelLikeTemp = CABodyLabel(textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let padding: CGFloat                      = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(temp)
        addSubview(feelLikeTemp)
        
        imageView.translatesAutoresizingMaskIntoConstraints     = false
        temp.translatesAutoresizingMaskIntoConstraints          = false
        feelLikeTemp.translatesAutoresizingMaskIntoConstraints  = false
        
        imageView.image         = UIImage(named: "placeholder-cloud")
        imageView.contentMode   = .scaleAspectFit
        
        feelLikeTemp.textColor  = .white
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            imageView.heightAnchor.constraint(equalToConstant: 90),
            
            feelLikeTemp.bottomAnchor.constraint(equalTo: bottomAnchor),
            feelLikeTemp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            feelLikeTemp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            feelLikeTemp.heightAnchor.constraint(equalToConstant: 40),
            
            temp.bottomAnchor.constraint(equalTo: feelLikeTemp.topAnchor),
            temp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            temp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
        
        temp.text           = "0º"
        feelLikeTemp.text   = "0º / 0º feels like 0º"
    }
}
