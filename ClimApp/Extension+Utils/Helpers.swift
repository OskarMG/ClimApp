//
//  Helpers.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/7/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit


struct Helpers {
    
    static func formatDate(dt: Double) -> String {
        let date                = NSDate(timeIntervalSince1970: dt)
        let dateFormatter       = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: date as Date)
    }
    
}
