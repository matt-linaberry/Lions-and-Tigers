//
//  Tiger.swift
//  Lions and Tigers
//
//  Created by Matthew Linaberry on 1/17/15.
//  Copyright (c) 2015 Matthew Linaberry. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0 // lets always give these a default value.  age:Int! was valid, too.
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    // instance functions
    
    func chuff() {
        // chuff:  a tiger's version of purrrrrrr
        println("tiger chuff chuff")
    }
    
}