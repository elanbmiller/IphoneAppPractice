//
//  TouchView.swift
//  ElanMiller-Lab3
//
//  Created by Labuser on 9/26/16.
//  Copyright © 2016 Labuser. All rights reserved.
//

import UIKit

class TouchView: UIView {

    var hasMoved = false;
    //Need an array to keep track of lines created
    var prevLinePoints : [Point] = []
    var toUndoLinePoints : [Point] = []
    
    //to keep track of updated point touched
    var endPoint: CGPoint!
    var toUndoPoint: CGPoint!
    var color = UIColor.blackColor()
    var width: CGFloat = 6.4;
    
    var firstTouch = 0;
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextSetLineCap(context, CGLineCap.Round)
        
        for prevLine in prevLinePoints{
            CGContextSetLineWidth(context, prevLine.width)
            CGContextBeginPath(context)
            //CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
            CGContextSetStrokeColorWithColor(context, prevLine.drawColor.CGColor)
            CGContextMoveToPoint(context, prevLine.start.x, prevLine.start.y)
            CGContextAddLineToPoint(context, prevLine.stop.x, prevLine.stop.y)
            CGContextStrokePath(context)
        }
        
    }
    
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        hasMoved = false;
        endPoint = (touches.first)!.locationInView(self) as CGPoint
        
        if(firstTouch == 0){
        toUndoPoint = endPoint
        }
        firstTouch = firstTouch + 1
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let touchPoint = (touches.first)!.locationInView(self.view) as CGPoint
//        nextPoint = touchPoint
        
        //draw(startPoint, ptB: nextPoint, color: UIColor.blackColor(), lineWidth: 2.0)
        
        
        //update new start line
      //  startPoint = touchPoint
        hasMoved = true;//not drawing a dot it seems
        var updatedPoint = (touches.first)!.locationInView(self) as CGPoint
        prevLinePoints.append(Point(start: endPoint, stop: updatedPoint, drawColor: color, width: width))
        
        endPoint = updatedPoint
        self.setNeedsDisplay()//calls drawRect
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(!hasMoved){
            prevLinePoints.append(Point(start: endPoint, stop: endPoint, drawColor: color, width: width))
            
            toUndoLinePoints.append(Point(start: toUndoPoint, stop: toUndoPoint, drawColor: color, width: width))
            
            firstTouch = 0
            
            self.setNeedsDisplay()
        }
        else{
            toUndoLinePoints.append(Point(start: toUndoPoint, stop: endPoint, drawColor: color, width: width))
           
            firstTouch = 0
            
            self.setNeedsDisplay()
        }
    }
    

}
