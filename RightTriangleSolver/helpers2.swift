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
        exit(0)
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
        
        //we also have to check to see if angle C has been assigned a value that is not 90 and move it to the other position
        if calcAngleC != 0 && calcAngleC != pi / 2 {
            if calcSideA != 0 && calcSideB != 0 { // have both side a and b need to swap with the bigger one
                if calcSideA > calcSideB { //side a is biggest swap A and C it has to be hypotenuse if its a right triangle
                    let temp : Double = calcAngleC
                    let temp2 : Double = calcSideC
                    calcAngleC = calcAngleA
                    calcSideC = calcSideA
                    calcAngleA = temp
                    calcSideA = temp2
                } else { // side b is the biggest swap B and C
                    let temp : Double = calcAngleC
                    let temp2 : Double = calcSideC
                    calcAngleC = calcAngleB
                    calcSideC = calcSideB
                    calcAngleB = temp
                    calcSideB = temp2
                }
            } else if calcSideA == 0 { //a is empty, use that
                let temp : Double = calcAngleC
                let temp2 : Double = calcSideC
                calcAngleC = calcAngleA
                calcSideC = calcSideA
                calcAngleA = temp
                calcSideA = temp2
            } else if calcSideB == 0 { //b is empty, use that
                let temp : Double = calcAngleC
                let temp2 : Double = calcSideC
                calcAngleC = calcAngleB
                calcSideC = calcSideB
                calcAngleB = temp
                calcSideB = temp2
            }
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
        } else if Int((calcAngleA + calcAngleB)*1000)/1000 == Int((pi / 2)*1000)/1000 { //if I don't have angle C, have to round for more "difficult cases"
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
        
        var testValue1: Double = 0.0
        var testValue2: Double = 0.0
        //this will determine if we have right triangle for non 90 degree angles
        if calcAngleA != 0 { // figure out which angle I have
            if calcSideC != 0 && calcSideA != 0 { // figure out which two sides
                testValue1 = sin(calcAngleA)
                testValue2 = calcSideA/calcSideC
            } else if calcSideC != 0 && calcSideB != 0 {
                testValue1 = cos(calcAngleA)
                testValue2 = calcSideB/calcSideC
            } else if calcSideB != 0 && calcSideA != 0 {
                testValue1 = tan(calcAngleA)
                testValue2 = calcSideA/calcSideB
            }
        } else if calcAngleB != 0 {
            if calcSideC != 0 && calcSideA != 0 {
                testValue1 = cos(calcAngleB)
                testValue2 = calcSideA/calcSideC
            } else if calcSideC != 0 && calcSideB != 0 {
                testValue1 = sin(calcAngleB)
                testValue2 = calcSideB/calcSideC
            } else if calcSideB != 0 && calcSideA != 0 {
                testValue1 = tan(calcAngleB)
                testValue2 = calcSideB/calcSideA
            }
        }
        if abs(testValue1 - testValue2) < 0.01 { //build in tolerance for rounding error
            return true
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
        if calcAngleA  + calcAngleB + calcAngleC * pi / 180 < pi {
            return true
        } else {
            return false
        }
    }
    //otherwise its ok since we don't let them enter a side greater than or equal to 180
    return true
}






