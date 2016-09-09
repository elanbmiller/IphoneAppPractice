//
//  ViewController.swift
//  ElanMiller-Lab1
//
//  Created by Labuser on 9/8/16.
//  Copyright © 2016 wustl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var InitPrice: UITextField!
    
    @IBOutlet weak var Discount: UITextField!
    
    @IBOutlet weak var SaleTax: UITextField!
    
    @IBOutlet weak var FinalPrice: UILabel!
    
    @IBOutlet weak var FinalPriceEuro: UILabel!
    
    @IBAction func updatePrice(sender: AnyObject) {
        
            var calculatedPrice: Double = InitPrice.text!.toDouble - InitPrice.text!.toDouble*(Discount.text!.toDouble/100.0) + InitPrice.text!.toDouble * (SaleTax.text!.toDouble/100.0)
        
            FinalPrice.text = "$" + String ((round(calculatedPrice * 100.0))/100.0)
            FinalPriceEuro.text = "€" + String (((round(calculatedPrice * 100.0))/100.0) * 0.89)
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
}

extension String {
    var toDouble:Double {
    
        if !self.isEmpty{
            
             var get = Double(self)
            
            if let casted = get{
                return casted
            }
            
            return 0.0
        }
        
        return 0.0
    }
}