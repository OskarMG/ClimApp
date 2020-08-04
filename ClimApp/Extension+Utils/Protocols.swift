//
//  Protocols.swift
//  ClimApp
//
//  Created by Oscar Martinez on 8/3/20.
//  Copyright © 2020 oscmg. All rights reserved.
//

import UIKit


protocol ChangeCityDelegate {
    func newEntered(city name: String, coord: [String : String]?)
}
