//
//  ViewController.swift
//  ElanMiller-Lab3
//
//  Created by Labuser on 9/20/16.
//  Copyright © 2016 Labuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NavigatiorBar: UINavigationBar!
    
    @IBOutlet weak var touchView: TouchView!
    
    @IBOutlet weak var YellowButton: UIButton!
    @IBOutlet weak var OrangeButton: UIButton!
    @IBOutlet weak var BlueButton: UIButton!
    @IBOutlet weak var GreenButton: UIButton!
    @IBOutlet weak var RedButton: UIButton!
    @IBOutlet weak var BlackButton: UIButton!
    
    
    @IBOutlet weak var WidthSlider: UISlider!
    var startPoint = CGPoint.zero
    var nextPoint = CGPoint.zero
    var currView: PointView? = nil
    
    var hasMoved = false
    

    
    @IBOutlet weak var ChangeBackground: UISwitch!
    @IBOutlet weak var ChangeLineType: UIBarButtonItem!
    
    @IBAction func ChangeToWhite(ChangeLineType: UIBarButtonItem){
        //var newCol : UIColor = randomColor()
        if(!self.touchView.prevLinePoints.isEmpty){
        for var i = 0; i < touchView.prevLinePoints.count; ++i{
            self.touchView.prevLinePoints[i].drawColor = randomColor()
            }
        }
        if(!self.touchView.toUndoLinePoints.isEmpty){
        for var i = 0; i < touchView.toUndoLinePoints.count; ++i{
            self.touchView.toUndoLinePoints[i].drawColor = randomColor()
            }
        }
        self.touchView.setNeedsDisplay()
    }
    
    @IBAction func sliderMoved(sender: AnyObject) {
        touchView.width = CGFloat(WidthSlider.value*10 + 1)
        print(touchView.width)
        self.touchView!.setNeedsDisplay()
    }
    
    func randomColor() -> UIColor{
        var red: CGFloat = CGFloat(drand48())
        var green: CGFloat = CGFloat(drand48())
        var blue: CGFloat = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
   
    
    @IBAction func BackgroundChange(ChangeBackground: UISwitch) {
        if !ChangeBackground.on{
            
            //touchView.backgroundColor = UIColor(patternImage: name: "ConnectTheDots.html")
           //touchView.backgroundColor = UIColor(patternImage: UIImage(named: "fish.jpg")!)
            
            //touchView.backgroundColor = UIColor(patternImage: UIImage(named: "fish.jpg")!)
            touchView.backgroundColor = randomColor()
           

        }
        else{
            touchView.backgroundColor = UIColor.whiteColor()
        }
    }
    
    @IBAction func clearLastLine(touchView: TouchView){
        if(!self.touchView!.prevLinePoints.isEmpty){
        
        while(self.touchView!.toUndoLinePoints.last?.start != self.touchView!
            .prevLinePoints.last?.start){
        
        self.touchView!.prevLinePoints.removeLast()
        
            }
        self.touchView!.prevLinePoints.removeLast()
        self.touchView!.toUndoLinePoints.removeLast()
            
        self.touchView!.setNeedsDisplay()
        
        
        }
    }
    
    
    
    @IBAction func chooseColor(button: UIButton){
        
        var chosen: UIColor
        if(button == BlackButton){
            chosen = UIColor.blackColor()
            touchView?.color = chosen
        }
        else if(button == RedButton){
            chosen = UIColor.redColor()
            touchView?.color = chosen
        }
        else if(button == GreenButton){
            chosen = UIColor.greenColor()
            touchView?.color = chosen
        }
        else if(button == BlueButton){
            chosen = UIColor.blueColor()
            touchView?.color = chosen
        }
        else if(button == OrangeButton){
            chosen = UIColor.orangeColor()
            touchView?.color = chosen
        }
        else if(button == YellowButton){
            chosen = UIColor.yellowColor()
            touchView?.color = chosen
        }
        //touchView?.color = chosen
    }
    
    
   
   
    @IBAction func clearScreen(touchView: TouchView) {
//        print("time to clear")
//        for v in view.subviews{
//            v.removeFromSuperview()
//        }
        //var clearingTouchView = touchView as! TouchView
        //clearingTouchView.prevLinePoints = []//empty prev linePoints
        
        
        
        self.touchView!.prevLinePoints.removeAll()

        //self.touchView!.toUndoLinePoints.removeAll()
        
//        touchView.setNeedsDisplay()
  
        
        self.touchView!.setNeedsDisplay()
        
        //clearingTouchView.setNeedsDisplay()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button =  UIButton(type: .Custom)
        button.frame = CGRectMake(0, 0, 100, 40) as CGRect
        button.backgroundColor = UIColor.redColor()
        button.setTitle("Button", forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("clickOnButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.titleView = button
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

}

