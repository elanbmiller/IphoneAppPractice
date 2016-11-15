//
//  PointView.swift
//  ElanMiller-Lab3
//
//  Created by Labuser on 9/24/16.
//  Copyright © 2016 Labuser. All rights reserved.
//

import UIKit


class PointView: UIView     {
    
    
    var thePoint:Point? {
        didSet  {
            setNeedsDisplay()
        }
    }
//
//    override func drawRect(rect: CGRect) {
//       // UIColor.blackColor().setFill()
//        //let path = createQuadPath([])
//        draw(ptA: startPoint)
//    }
    
    func draw(ptA: CGPoint, ptB: CGPoint, color: UIColor,  lineWidth: CGFloat){
        let path = createQuadPath([ptA, ptB]);
        
        path.moveToPoint(ptA)
        path.addLineToPoint(ptB)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = color.CGColor
        shapeLayer.lineWidth = lineWidth
        self.layer.addSublayer(shapeLayer)
        
    }
    
    
}