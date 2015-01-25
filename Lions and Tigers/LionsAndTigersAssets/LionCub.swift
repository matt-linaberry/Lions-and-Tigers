//
//  LionCub.swift
//  Lions and Tigers
//  Subclass of the Lion class!
//  Created by Matthew Linaberry on 1/25/15.
//  Copyright (c) 2015 Matthew Linaberry. All rights reserved.
//

import Foundation
class LionCub: Lion {
    func rubLionCubsBelly()
    {
        println("LionCub: Snuggle and be happy")
    }
    
    override func roar() {
        super.roar()
        println("LionCub: GRWL!!!")
    }
    
    override func randomFact() -> String {
        var randomFactString:String
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else
        {
            randomFactString = "Cubs begin eating meat at about the age of six weeks."
        }
        
        return randomFactString
    }
}