//: Playground - noun: a place where people can play

import UIKit

// Intro to functions
// Write functions to peform tasks
// Call on functions to execute the code

// name, parameters, return-type, body

var playerPosition : Int = 0
var buttonPressed : String = "right"

func movePlayerForwards() {
    playerPosition += 1
}
func movePlayerBackwards() {
    playerPosition -= 1
}

func movePlayer() {
    if (buttonPressed == "right") {
        movePlayerForwards()
    } else if (buttonPressed == "left") {
        movePlayerBackwards()
    } else {
        print("invalid command")
    }
}
movePlayer()
//movePlayerForwards()
//playerPosition
//movePlayerBackwards()

func movePlayer(i : Int) {
    
}

// Functions with parameters
// Why parameters are useful
// How to use parameters in function body

var position : Int = 0

func moveForwards(positionChange : Int) {
    position += positionChange
}
func moveBackwards(positionChange : Int) {
    position -= positionChange
}

moveForwards(positionChange: 5)
moveBackwards(positionChange: 2)
position

func move(positionChange : Int) {
    position += positionChange
}

move(positionChange: 3)

// Function return statements
// What it means to return a value
// How to use functions with return types

let numberArray : [Int] = [1,6,3,9,2,5]

func findMax(numArray : [Int]) -> Int {
    var max : Int = 0
    for number in numArray {
        if number > max {
            max = number
        }
    }
    return max
}

let result = findMax(numArray: numberArray)

var characterPosition : Int = 0
let obstaclePosition : Int = 5
let endPosition : Int = 10

func runGame() {
    while (characterPosition < endPosition) {
        characterPosition += 1
        if (characterPosition == obstaclePosition) {
            print("player collided with obstacle")
            return
        }
    }
    // some other code here
    print("player reached the end of the game")
}

runGame()

// Parameter variations part 1
// Argument labels
// Improve parameter readability

var position : Int = 0

func move(byAmount positionChange : Int) {
    position += positionChange
}

//move(positionChange: 3)
move(byAmount: 3)
position

func moveBy(_ positionChange : Int) {
    position += positionChange
}

moveBy(2)

// Parameter variations part 2
// Default parameter values
// Assign values to parameters in function declaration

var health : Int = 50

func heal(healAmount : Int = 10) {
    health += healAmount
}

heal(healAmount: 50)
health

// Parameter variations part 3
// Inout parameters
// Way to mutate variable values within the function body

var int1 : Int = 5
var int2 : Int = 10

func swapInts(firstInt : inout Int, secondInt : inout Int) {
    let tempInt : Int = firstInt
    firstInt = secondInt
    secondInt = tempInt
}

swapInts(firstInt: &int1, secondInt: &int2)
int1
int2

// Parameter variations part 4
// Variadic parameters
// Way to enter in 0 or more parameter values

var inventory : [(String,Int)] = [("Coat",2),("Food",5),("Shoes",2)]

/*func tallyItems(inventoryArray: [(String,Int)]) -> Int {
 var count : Int = 0
 for (_,quantity) in inventoryArray {
 count += quantity
 }
 return count
 }*/

//let result = tallyItems(inventoryArray: inventory)
//let result = tallyItems(inventoryArray: ("Coat",2),("Food",4))

func tallyItems(_ inventory : (String,Int)...) -> Int {
    var count : Int = 0
    for (_,quantity) in inventory {
        count += quantity
    }
    return count
}

let result = tallyItems(("Coat",2),("Food",4),("Shoes",2))

// Multiple returns
// Use tuples to return multiple values

var inventory : [(String,Int)] = [("Shoes",2),("Socks",2),("Food",5)]

func findMost(inventory : [(String,Int)]) -> (String,Int) {
    var highestQuantity : Int = 0
    var highestName : String = ""
    
    for (name,quantity) in inventory {
        if quantity >= highestQuantity {
            highestQuantity = quantity
            highestName = name
        }
    }
    return (highestName,highestQuantity)
}

let result = findMost(inventory: inventory)
