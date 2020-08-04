//
//  CATitleLabel.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit

class CATitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
         configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, weight: UIFont.Weight, textColor: UIColor) {
        super.init(frame: .zero)
        self.textAlignment  = textAlignment
        self.font           = UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.textColor      = textColor
        configure()
    }
    
    
    private func configure() {
        adjustsFontSizeToFitWidth                   = true
        minimumScaleFactor                          = 0.9
        lineBreakMode                               = .byTruncatingTail
        shadowColor                                 = .darkGray
        translatesAutoresizingMaskIntoConstraints   = false
    }

}
