//
//  main.swift
//  RightTriangleSolver
//
//  Created by admin on 9/5/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

// initialize the measurements
// variables for the angles
var calcAngleA : Double = 0.0
var calcAngleB : Double = 0.0
var calcAngleC : Double = 0.0

// variables for the sides
var calcSideA : Double = 0.0
var calcSideB : Double = 0.0
var calcSideC : Double = 0.0

// side and angle counters
var numOfSides : Int = 0
var numOfAngles : Int = 0

//Boolean variables to use for the CONTROL FLOW
var isRight : Bool = false
var isThreeSides : Bool = false
var isTwoAngles : Bool = false
var isOneAngle : Bool = false
var isTriangle : Bool = false

//Setup a constant for pi
let pi = 3.14159

print("Welcome to the right triangle solver!")


print("Please enter three measurements from your triangle.")

GetMeasurements()

//Determine what type of measurements that you have been given. ie two sides and 1 angle, 3 sides, 2 angles and 1 side
//Note that 3 angles is a failure case, you cannot determine the dimensions of a triangle with 3 angles
//Order the sides and angles (make sure that the largest angle is angle C
//Determine if the measurements form a triangle
//Determine if the measurements form a right triangle
//Determine the remaining measurements based on information provided

if isRight {
    print("Your triangle has the following measurements:")
    print("a = \(calcSideA) b = \(calcSideB) c = \(calcSideC)")
    print("A = \(calcAngleA * 180 / pi) B = \(calcAngleB * 180 / pi) C = \(calcAngleC * 180 / pi)")
}


