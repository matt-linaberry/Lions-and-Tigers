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
    
    func chuffANumberOfTimes(numberOfTimes:Int)
    {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
    }
    
    func chuffANumberOfTimes(numberOfTimes:Int, isLoud: Bool)
    {
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud {
                chuff()
            }
            else
            {
                println("TIger: purrrrrrrrr")
            }
        }
    }
    
    func ageInTigerYearsFromAge(regularAge:Int) -> Int {
        let newAge = regularAge * 3
        return newAge
    }
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact:String
        if randomNumber == 0 {
            randomFact = "The Tiger is the biggest species in the cat family."
        }
        else if randomNumber == 1 {
            randomFact = "Tigers can reach a length of 3.3 meters"
        }
        else {
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
        }
        return randomFact
    }
}