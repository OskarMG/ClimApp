//
//  CAButton.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit

class CAButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String, borderColor: UIColor?) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        self.backgroundColor    = backgroundColor
        self.layer.borderColor  = borderColor?.cgColor ?? UIColor.white.cgColor
        configure()
    }
    
    
    private func configure() {
        layer.cornerRadius  = 10
        layer.borderWidth   = 2
        
        setTitleColor(.white, for: .normal)
        
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
