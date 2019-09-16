//
//  helpers.swift
//  RightTriangleSolver
//
//  Created by admin on 9/5/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func GetMeasurements () {

    var numOfGoodMeasurements : Int = 0
    
    while numOfGoodMeasurements < 3 {
        //Grab the measurements
        print("Would you like to enter a (S)ide or an (A)ngle measurement?")
        if let inputType = readLine() {
            if inputType == "S" || inputType == "s" {
                // get a side measurement
                print("Enter side length, without a unit")
                if let currentMeasurement = readLine() {
                    if let side = Double(currentMeasurement) {
                        if side <= 0.0 {
                            print("Not a valid measurement, try again!")
                        } else {
                            print("Which side is this: a, b or c?")
                            if let choice = readLine() {
                                if choice == "a" {
                                    if calcSideA != 0.0 {
                                        print("You already entered that measurement!  Try again!")
                                    } else {
                                        calcSideA = side
                                        print("You entered a side length, a = \(calcSideA)")
                                        numOfGoodMeasurements += 1
                                        numOfSides += 1
                                    }
                                } else if choice == "b" {
                                    if calcSideB != 0.0 {
                                        print("You already entered that measurement!  Try Again!")
                                    } else {
                                        calcSideB = side
                                        print("You entered a side length, b = \(calcSideB)")
                                        numOfGoodMeasurements += 1
                                        numOfSides += 1
                                    }
                                } else if choice == "c" {
                                    if calcSideC != 0.0 {
                                        print("You already entered that measurement!  Try Again!")
                                    } else {
                                        calcSideC = side
                                        print("You entered a side length, c = \(calcSideC)")
                                        numOfGoodMeasurements += 1
                                        numOfSides += 1
                                    }
                                } else {
                                    print("Invalid input, try again!")
                                }
                            }
                        }
                    } else {
                        print("That input was invalid, try again!")
                    }
                }
            } else if inputType == "A" || inputType == "a" {
                print("Enter an Angle measure (in degrees)")
                if let currentMeasurement = readLine() {
                    if var angle = Double(currentMeasurement) {
                        if angle <= 0.0 && angle >= 180 {
                            print("Not a valid measurement, try again!.")
                        } else {
                            angle *= pi / 180
                            print("Which angle is this: A, B or C?")
                            if let choice = readLine() {
                                if choice == "A" {
                                    if calcAngleA != 0.0 {
                                        print("You already entered that measurement!")
                                    } else {
                                        calcAngleA = angle
                                        print("You entered an angle, A = \(calcAngleA)")
                                        numOfGoodMeasurements += 1
                                        numOfAngles += 1
                                    }
                                } else if choice == "B" {
                                    if calcAngleB != 0.0 {
                                        print("You already entered that measurement!")
                                    } else {
                                        calcAngleB = angle
                                        print("You entered an angle, B = \(calcAngleB)")
                                        numOfGoodMeasurements += 1
                                        numOfAngles += 1
                                    }
                                } else if choice == "C" {
                                    if calcAngleC != 0.0 {
                                        print("You already entered that measurement!")
                                    } else {
                                        calcAngleC = angle
                                        print("You entered an angle, C = \(calcAngleC)")
                                        numOfGoodMeasurements += 1
                                        numOfAngles += 1
                                    }
                                } else {
                                    print("Invalid input, try again!")
                                }
                            }
                        }
                    } else {
                        print("That input was invalid, try again!")
                    }
                }
            } else {
                
                print("Something went wrong, try again!")
            }
        }
    }
}

func DetermineType() {
    
    if numOfSides == 3 && numOfAngles == 0 {
        print("You have all 3 sides!  The angles need to be calculated!")
        isThreeSides = true
    }
    
    if numOfAngles == 2 && numOfSides == 1 {
        print("You have two angles and 1 side.")
        isTwoAngles = true
    }
    
    if numOfAngles == 3 && numOfSides == 0 {
        print("You have 3 angles, cannot calculate this triangle!")
    }
    
    if numOfAngles == 1 && numOfSides == 2 {
        print("You have one angle and 2 sides.")
        isOneAngle = true
    }
}

func OrderSides () {
    if isThreeSides { //In this case, we just have to swap the sides to make sure the biggest is side c
        if calcSideA > calcSideB && calcSideA > calcSideC{
            //sideA is biggest, swap them
            let temp : Double = calcSideC
            calcSideC = calcSideA
            calcSideA = temp
        }
        else if calcSideB > calcSideC {
            //side B is biggest
            let temp : Double = calcSideC
            calcSideC = calcSideB
            calcSideB = temp
        }
    }
    
    if isTwoAngles || isOneAngle { //with these two cases we have to deal with one of the given angles being 90 degrees and not
                     //having been assigned to C, if this happens we have to swap both the angle and side measures
        if calcAngleA == 90.0 * pi / 180 { //make this angle angle C}
            let temp : Double = calcAngleC
            let temp2 : Double = calcSideC
            calcAngleC = calcAngleA
            calcSideC = calcSideA
            calcAngleA = temp
            calcSideA = temp2
        } else if calcAngleB == 90.0 * pi / 180 { //make this angle angle C
            let temp : Double = calcAngleC
            let temp2 : Double = calcSideC
            calcAngleC = calcAngleB
            calcSideC = calcSideB
            calcAngleB = temp
            calcSideB = temp2
        }
    }
    
}

func CheckRight () -> Bool { // This one will check to see if we have a right triangle based on the information that
                                //we've been given
                                // We can make the assumption that angle C and side C has been set up as the 90 and the hypo
    
    if isThreeSides { //need pythagorean theorem
        if calcSideA * calcSideA + calcSideB * calcSideB == calcSideC * calcSideC {
            return true
        }
    }
    
    if isTwoAngles { //we can use simple addition
        
        if calcAngleC == 90.0 * pi / 180 { //if I have angle C as 90, I have a right triangle
            return true
        } else if calcAngleA + calcAngleB == pi / 2 { //if I don't have angle C
            return true
        }
    }
    
    if isOneAngle { //angle C HAS to be 90 or we're out, hypotenuse has to be the longest as well
        if calcSideC != 0.0 {
            if calcSideC > calcSideB && calcSideC > calcSideA {
                if calcAngleC == 90.0 * pi / 180 {
                    return true
                }
            }
        } else {
            if calcAngleC == 90.0 * pi / 180 {
                return true
            }
        }
    }
    
    return false
}

func CheckTriangle () -> Bool {
    if isThreeSides {
        if calcSideA + calcSideB > calcSideC {
            return true
        } else {
            return false
        }
    }
    
    if isTwoAngles { //have to make sure that the angles are less than 180 degrees
        if calcAngleA * pi / 180 + calcAngleB * pi / 180 + calcAngleC * pi / 180 <= pi {
            return true
        } else {
            return false
        }
    }
    //otherwise its ok since we don't let them enter a side greater than or equal to 180
    return true
}

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
            calcSideB = sqrt(calcSideC * calcSideC - calcSideB * calcSideB)
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


