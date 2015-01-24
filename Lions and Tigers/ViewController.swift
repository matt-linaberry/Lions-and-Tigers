//
//  ViewController.swift
//  Lions and Tigers
//
//  Created by Matthew Linaberry on 1/16/15.
//  Copyright (c) 2015 Matthew Linaberry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!

    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var randomFactLabel: UILabel!
    var myTigers:[Tiger] = []
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()  // instantiate a struct called Tiger
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(5, isLoud: false)
        self.myTigers.append(myTiger)
        
        println("my tiger's name is: \(myTiger.name), its age is \(myTiger.age), its breed is \(myTiger.breed) and its image is \(myTiger.image)")
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indo-Chinese Tiger"
        secondTiger.age = myTiger.ageInTigerYearsFromAge(2)
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        secondTiger.chuff()
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = myTiger.ageInTigerYearsFromAge(4)
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = myTiger.ageInTigerYearsFromAge(5)
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]  // hey lets append these!
        
        myTiger.chuffANumberOfTimes(3)
        secondTiger.chuffANumberOfTimes(2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        var randomIndex:Int
        do
        {
            randomIndex = Int(arc4random_uniform(UInt32(self.myTigers.count)))
        } while self.currentIndex == randomIndex
        
        self.currentIndex = randomIndex
        
        let tiger = self.myTigers[randomIndex]
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        breedLabel.text = tiger.breed
//        ageLabel.text = "\(tiger.age) years old"
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age) years old"
            self.breedLabel.text = tiger.breed
            self.randomFactLabel.text = tiger.randomFact()
            }, completion: {
                (finished: Bool) -> () in
        })
    }

}

