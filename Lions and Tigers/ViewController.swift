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
    var lions:[Lion] = []
    var lionCubs:[LionCub] = []
    var currentIndex = 0
    var currentAnimal = (species: "Tiger", index: 0)  //the tuple
    
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
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        lion.roar()
        lioness.roar()
        
        lion.changeToAlphaMale()
        
        println(lion.isAlphaMale)
        
        self.lions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named:"LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        lionCub.isAlphaMale = true
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        self.lionCubs += [lionCub, femaleLionCub]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateViews()
    }
    
    func updateAnimal() {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateViews() {

        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                if self.currentAnimal.species == "Tiger" {
                    let tiger = self.myTigers[self.currentAnimal.index]
                    self.myImageView.image = tiger.image
                    self.breedLabel.text = tiger.breed
                    self.ageLabel.text = "\(tiger.age)"
                    self.nameLabel.text = tiger.name
                    self.randomFactLabel.text = tiger.randomFact()
                }
                else if self.currentAnimal.species == "Lion" {
                    let lion = self.lions[self.currentAnimal.index]
                    self.myImageView.image = lion.image
                    self.breedLabel.text = lion.subspecies
                    self.ageLabel.text = "\(lion.age)"
                    self.nameLabel.text = lion.name
                    self.randomFactLabel.text = lion.randomFact()
                    
                }
                else if self.currentAnimal.species == "LionCub" {
                    let lionCub = self.lionCubs[self.currentAnimal.index]
                    self.myImageView.image = lionCub.image
                    self.breedLabel.text = lionCub.subspecies
                    self.ageLabel.text = "\(lionCub.age)"
                    self.nameLabel.text = lionCub.name
                    self.randomFactLabel.text = lionCub.randomFact()
                }
                
                self.randomFactLabel.hidden = false
            }, completion: {
                (finished: Bool) -> () in
        })
        
    }

}

