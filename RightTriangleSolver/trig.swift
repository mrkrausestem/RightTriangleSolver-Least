//
//  trig.swift
//  RightTriangleSolver
//
//  Created by admin on 10/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func CalculateTriangle() {
    if isThreeSides{ //Need to figure out the other two angles
        //Calculate Angle A
        calcAngleA = asin(calcSideA/calcSideC)
        //Calculate Angle B
        calcAngleB = asin(calcSideB/calcSideC)
        calcAngleC = pi / 2
    }else if isTwoAngles { //Need to figure out missing angle and other two sides!
        // First calculate missing angle
        if calcAngleA == 0 {
            calcAngleA = pi - calcAngleB - calcAngleC
        }else if calcAngleB == 0 {
            calcAngleB = pi - calcAngleA - calcAngleC
        }else if calcAngleC == 0 {
            calcAngleC = pi - calcAngleA - calcAngleB
        }
        //now calculate the remaining sides
        if calcSideA != 0 {
            calcSideC = calcSideA/sin(calcAngleA)
            calcSideB = calcSideA*tan(calcAngleB)
        } else if calcSideB != 0 {
            calcSideA = calcSideB*tan(calcAngleA)
            calcSideC = calcSideB/cos(calcAngleA)
        } else if calcSideC != 0 {
            calcSideA = calcSideC*sin(calcAngleA)
            calcSideB = calcSideC*sin(calcAngleB)
        }
    } else if isOneAngle { //Need to figure out other side, then the angles.  Remember we've already
        // confirmed this is a right triangle and angle C is 90 degrees
        // Use pythagorean theroem to find missing side.
        if calcSideA == 0 {
            calcSideA = sqrt(calcSideC * calcSideC - calcSideB * calcSideB)
        } else if calcSideB == 0 {
            calcSideB = sqrt(calcSideC * calcSideC - calcSideA * calcSideA)
        } else if calcSideC == 0 {
            calcSideC = sqrt(calcSideA * calcSideA + calcSideB * calcSideB)
        }
        
        //now need to find angle a and b
        //Calculate Angle A
        calcAngleA = asin(calcSideA/calcSideC)
        //Calculate Angle B
        calcAngleB = asin(calcSideB/calcSideC)
        
    }
}
