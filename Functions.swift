//
//  Functions.swift
//  ElanMiller-Lab3
//
//  Created by Labuser on 9/26/16.
//  Copyright © 2016 Labuser. All rights reserved.
//

import Foundation
import UIKit

func createQuadPath(arrayOfPoints: [CGPoint]) -> UIBezierPath {
    let newPath = UIBezierPath()
    let firstLocation = arrayOfPoints[0]
    newPath.moveToPoint(firstLocation)
    let secondLocation = arrayOfPoints[1]
    let firstMidpoint = findMidpoint(firstLocation, secondPoint: secondLocation)
    newPath.addLineToPoint(firstMidpoint)
    for index in 1 ..< arrayOfPoints.count-1 {
        let currentLocation = arrayOfPoints[index]
        let nextLocation = arrayOfPoints[index + 1]
        let midpoint = findMidpoint(currentLocation, secondPoint: nextLocation)
        newPath.addQuadCurveToPoint(midpoint, controlPoint: currentLocation)
    }
    let lastLocation = arrayOfPoints.last
    newPath.addLineToPoint(lastLocation!)
    return newPath
}
//helper for createQuadPath function
private func findMidpoint(firstPoint: CGPoint, secondPoint: CGPoint) -> CGPoint {
    var xVal: Double = Double((firstPoint.x + secondPoint.x)/2)
    var yVal: Double = Double((firstPoint.y + secondPoint.y)/2)
    var midPt: CGPoint = CGPoint(x: xVal, y: yVal)
    return midPt
}
