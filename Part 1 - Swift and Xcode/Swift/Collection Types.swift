//: Playground - noun: a place where people can play

import UIKit

// Intro to Collection Types
// What collections are and how to use them
// Declaring and initializing arrays

let coat = "coat"
var inventory : [String]
inventory = ["food",coat,"hat","matches"]
inventory = ["fruit",coat]

let randomArray : [Any] = [1,false,"hello"]

// Different ways to create arrays
// Initialize an empty array
// Create an array of all the same elements

let array1 : [Int] = []
let array2 = [Int]()

let array3 : [Int] = [0,0,0,0,0]
var array4 : [Int] = Array(repeating: 0, count: 5)

// Basic array operations
// Retrieve elements or info about array
// Modify array contents

var inventory : [(String,Int)] = [("Fruit",3),("Coat",1),("Shoes",2)]
let firstItem = inventory[0]
let firstItem2 = inventory.first
let count : Int = inventory.count

inventory[2] = ("Shoes",1)
inventory.append(("Water bottle",5))
inventory.insert(("Matches",20), at: 1)

let removedElement = inventory.remove(at: 2)
inventory.removeAll()

// Common array operations
// Retrieve elements or information from array
// Modify array or elements

var inventory : [(String,Int)] = [("Hat",1),("Coat",1),("Gloves",2)]
let secondItem : (String,Int) = inventory[1]
//let fourthItem = inventory[3]
let InventoryCount : Int = inventory.count
let firstItem : (String,Int)? = inventory.first
let firstItemName : String? = firstItem?.0
//inventory.contains

inventory[0] = ("Hat",2)
inventory[0...1] = [("Hat",3),("Coat",0)]
//inventory.append(("Shoes",2))
//inventory.append(contentsOf: [("Shoes",2),("Socks",2)])
inventory += [("Shoes",2),("Socks",2)]
inventory.insert(("Fruit",3), at: 0)
let removedTuple = inventory.remove(at: 2)
inventory.removeAll()

// Multidimensional arrays
// Create arrays within arrays
// Retrieve elements from multidimensional arrays

let groceryList : [String] = ["fruit","cheese","bread"]
var shoppingList : [[String]] = [
    groceryList,
    ["t-shirt","shorts"],
    ["paper towel"]]

let shorts : String = shoppingList[1][1]
let bread : String = shoppingList[0][2]

// Ranges
// How to create ranges of numbers
// How to access numbers within a range

let range1 = 1...10
let range2 = 1..<10
let lowerThan5 = ...5
let higherThan5 = 6...

/*for number in range1 {
 print(number)
 }*/
/*for number in range2 {
 print(number)
 }*/

let numberArray : [Int] = [1,2,3,4,5]
for number in numberArray[..<3] {
    print(number)
}
