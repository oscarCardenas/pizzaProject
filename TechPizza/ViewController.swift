//
//  ViewController.swift
//  TechPizza
//
//  Created by Usuario on 07-02-16.
//  Copyright © 2016 techCourse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.start.layer.borderColor = UIColor.clearColor().CGColor
        self.start.layer.borderWidth = 1
        self.start.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}