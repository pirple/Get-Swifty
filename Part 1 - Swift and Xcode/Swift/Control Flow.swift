//: Playground - noun: a place where people can play

import UIKit

// ****************************** Intro *********************
// Intro to control flow
// Discuss how control flow is used
// If and else statements

let buttonPressed : String = "left"
var playerPosition : Int = 0

if (buttonPressed == "right") {
    playerPosition += 1
} else {
    playerPosition -= 1
}

// ****************************** Else if *************************************
// Else if statements
// Test for additional conditions
// Compare to multiple "ifs"

let buttonPressed : String = "left"
var playerXPosition : Int = 0
var playerYPosition : Int = 0

if (buttonPressed == "right") {
    playerXPosition += 1
} else if (buttonPressed == "left") {
    playerXPosition -= 1
} else if (buttonPressed == "up") {
    playerYPosition += 1
} else if (buttonPressed == "down") {
    playerYPosition -= 1
} else {
    print("invalid button")
}

if (buttonPressed == "up") {
    playerYPosition += 1
}

// ********************** Testing multiple conditions simultaneously *****************
// Testing additional conditions
// && and || operators
// Nested if statements

let firstButtonPressed : String = "right"
let secondButtonPressed : String = "shift"
var playerPosition : Int = 0

if (firstButtonPressed == "right" && secondButtonPressed == "shift") {
    playerPosition += 2
}

if (firstButtonPressed == "right" || firstButtonPressed == "d") {
    playerPosition += 1
}

if (firstButtonPressed == "right") {
    if (secondButtonPressed == "shift") {
        playerPosition += 2
    }
}

if (firstButtonPressed == "right") {
    playerPosition += 1
    if (secondButtonPressed == "shift") {
        playerPosition += 1
    }
}

// **************************** Switch Statement *****************************

// Switch statements
// Provide cases for each possible value of a variable
// Compare to if/else if/else statement

let buttonPressed : String = "up"
var xPosition : Int = 0
var yPosition : Int = 0

/*if (buttonPressed == "right") {
 xPosition += 1
 } else if (buttonPressed == "left") {
 xPosition -= 1
 } else if (buttonPressed == "up") {
 yPosition += 1
 } else if (buttonPressed == "down"){
 yPosition -= 1
 } else {
 print("invalid command")
 }*/

switch buttonPressed {
case "right":
    xPosition += 1
case "left":
    xPosition -= 1
case "up":
    yPosition += 1
case "down":
    yPosition -= 1
default:
    print("invalid command")
}

// *********************** Switch statements part 2 ******************************
// Ranges/multiple values
// Working with tuples (decomposing, value-bindings, where)

var health : Int = 50
switch health {
case 100:
    print("full health")
case 50..<100:
    print("healthy")
case 1..<50:
    print("low health")
case 0:
    print("dead")
default:
    print("health out of range")
}

var itemName : String = "fruit"
switch itemName {
case "hat","coat","shoes":
    print("item is a clothing item")
case "meat","fruit","bread":
    print("item is a food item")
default:
    print("we do not have a category for this item")
}

/*var item : (String,Int) = ("fruit",5)
 switch item {
 case ("fruit",5):
 print("We have 5 fruits")
 case ("fruit",_):
 print("We have fruits but don't know how many")
 case (_,5):
 print("We have 5 of some item but don't know the name")
 default:
 print("We don't know this item or quantity")
 }*/

var item : (String,Int) = ("fruit",2)
switch item {
case (let name,let quantity) where quantity == 5:
    print("We have 5 \(name)")
case ("fruit",_):
    print("We have fruits but don't know how many")
case (_,5):
    print("We have 5 of some item but don't know the name")
default:
    print("We don't know this item or quantity")
}

// ****************************** Test nil values **********************************
// == nil, if let, guard let
// Ways to prevent accidentally unwrapping nil value

var item : String? = "fruit"
var itemName : String = ""

if (item != nil) {
    itemName = item!
}

//item = nil
if let itemName2 = item {
    // execute some code here
    print(itemName2)
}

func doSomething() {
    guard let itemName3 = item else { return }
    print(itemName3)
}

doSomething()

// Intro to loops
// How loops work and why they are useful
// While and repeat while loops

var playerPosition : Int = 0
let endPosition : Int = 10

/*
 while (playerPosition < endPosition) {
 playerPosition += 1
 }
 */
repeat {
    playerPosition += 1
    print(playerPosition)
} while (playerPosition < endPosition)

// For-in loops
// Compare and contrast to while loops
// When to use for vs while loop

//for index in range { loop body }

/*
 for number in 1...10 {
 print(number)
 }
 
 var count : Int = 0
 for _ in 1...10 {
 count += 1
 }
 
 
 // for(Int number = 1; number <= 10; number = number + 2) { println(number) }
 for number in stride(from: 1, to: 10, by: 2) {
 print(number)
 }
 
 
 var inventoryNames : [String] = ["food","clothes","water","axe"]
 for itemName in inventoryNames {
 print(itemName)
 }
 
 for index in inventoryNames.indices {
 print(index)
 }
 
 var inventory : [(String,Int)] = [("fruit",3),("coat",2),("axe",1)]
 for (name,quantity) in inventory {
 print("name is \(name)")
 print("quantity is \(quantity)")
 }
 
 for number in 1...10 {
 print(number)
 }
 
 
 var index : Int = 1
 while (index <= 10) {
 print(index)
 index += 1
 }
 */

var playerPosition : Int = 0
let endPosition : Int = 10
while (playerPosition < endPosition) {
    playerPosition += 1
}
