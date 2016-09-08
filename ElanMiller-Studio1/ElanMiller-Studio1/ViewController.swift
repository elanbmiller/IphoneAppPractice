//
//  ViewController.swift
//  ElanMiller-Studio1
//
//  Created by Labuser on 9/8/16.
//  Copyright © 2016 wustl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var Switch: UISwitch!

    @IBOutlet weak var Image: UIImageView!
    
    @IBAction func switchAction() {
        if Switch.on{
            Image.alpha = 1.0
        }else{
            Image.alpha = 0.3
        }
    }
    
}

