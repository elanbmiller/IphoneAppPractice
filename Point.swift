//
//  Point.swift
//  ElanMiller-Lab3
//
//  Created by Labuser on 9/24/16.
//  Copyright © 2016 Labuser. All rights reserved.
//

import Foundation
import UIKit

struct Point{
    var start: CGPoint
    var stop: CGPoint
    var drawColor: UIColor
    var width:CGFloat
    
    
    init(start: CGPoint, stop: CGPoint, drawColor: UIColor, width: CGFloat){
        self.start = start
        self.stop = stop
        self.drawColor = drawColor
        self.width = width
    }
    
}