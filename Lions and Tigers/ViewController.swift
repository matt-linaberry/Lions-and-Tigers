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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
    }

}

