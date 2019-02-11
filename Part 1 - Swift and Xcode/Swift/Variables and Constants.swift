//: Playground - noun: a place where people can play

import UIKit

// ********************** Variables and constants in Swift 4 **********************

// Variables and Constants Learning Goals:
// Intro: main concepts, syntax
// Common types: primitives, strings, optionals, tuples
// Conversions and operators: restrictions, change/test values
// Advanced topics: binary operators, casting, assertions/preconditions

// ************************* Intro to variables and constants *************************
// Variables are a way to associate a value with a name
// Variables are used as placeholders to keep track of values and how they change throughout the code
// Compiler allocates space in memory and stores value. Retrieve value by calling on variable name
// Range of values (data type) and amount of space in memory depend on variable type
// Variable values can change but constants cannot once assigned

// var/let name : type = value  (declaration and initialization)
// var/let name : type          (just declaration, default value assigned)
// name = value                 (just initialization, must be declared previously)
// var/let name = value         (compiler infers type based on value assigned)

var health : Int = 100    // assigning a literal value to a variable
health = 50
//health = "hello"              cannot store String values in Int type variable

var currentHealth : Int = health    // assigning the value of a previously
                                 // defined variable
let maxHealth : Int = 100          // assigning a literal value to a constant
//maxHealth = 120                           cannot reassign a constant value

health = maxHealth          // health takes on same value as maxHealth
health = 80

// ************************** Primitive variable types: ****************************
// Some of the simplest data types in Swift 4
// Split into numerical types (Ints, Floats, and Doubles), Booleans, and Characters

// Numerical types: Ints, Floats, Doubles
// Use Ints and variants to represent whole numbers
// Numbers beside Ints represent number of bits assigned to each Int (higher number = greater range of numbers but more space in memory)
// UInts can only represent positive whole numbers
// Default value is 0
let int1 : Int = 0
let int2 : Int8 = 127
//let int2 : Int8 = 128         128 is too high a value, must use Int16 or higher
let int3 : Int
let int4 = 54
//let int3 : UInt = -2          cannot assign negative value to UInt

// Use floats or doubles to represent decimal numbers
// Doubles represent twice the number of decimal places as Floats and are 64 bit vs 32 bit floats
// Default value is 0.0
let float1 : Float = 54.5
let double1 : Double = 54.6
let double2 : Double = 5

// Boolean: true/false values
// Use when a variable can have only 2 states (ex. door is open or shut), often used in conditional testing
// Default value is false
let bool1 : Bool = false
let bool2 : Bool = 5 > 3    // Can assign value of true/false expression

// Character: any unicode character that is 1 digit in length and between ""
// Use to store any unicode-representable character such as a letter, number, symbol, or even emoji
let char1 : Character = "?"
let char2 : Character = "🐫"
let char3 : Character = "5"

// ************************************ Strings ***************************************
// Essentially a collection of characters all strung together
// Much more powerful than primitive types as there are many functions associated with strings and many attributes we can retrieve and modify, access a list by typing string_name.(list of attributes and methods appear after .)
// Used to represent messages or text or retrieve values from/store values into text-based UI elements

let name : String = "Mammoth Interactive"
let count = name.count
let firstChar = name.first
let lastChar = name.last

// Must access index based on index type variable rather than index as an Int
let endIndex = name.index(name.startIndex, offsetBy: 7)
let mammoth : String = name.substring(to: endIndex)

let startIndex = name.index(name.startIndex, offsetBy: 8)
let interactive : String = name.substring(from: startIndex)

let startIndex2 = name.index(name.startIndex, offsetBy: 3)
let endIndex2 = name.index(name.startIndex, offsetBy: 7)
let moth : String = name.substring(with: startIndex2..<endIndex2)

let multilineString : String = """
Hello, how are you?
I'm doing very well, how are you?
"""

// Interpolation, retrieves variable/constant value, converts to a string, and inserts it into an existing string
let numberOfEggs : Int = 12
let eggsString : String = "I have \(numberOfEggs) eggs"

// *********************************** Optionals ****************************************
// Nil values and problems they cause
// Fix problem through optionals and unwrapping

var itemInRightHand : String? = "Axe"
//
var length : Int? = itemInRightHand?.count

//itemInRightHand = "Pickaxe"
//itemInRightHand = nil
var length2 : Int = (itemInRightHand?.count)!

// *********************************** Tuples ************************************
// Tuples attach multiple values to a single variable
// Values can be of different types but are generally related
// Can access elements via index, by decomposing tuple, or by naming elements in tuple

//var/let name : (value1_type, value2_type) = (value1,value2)   general set up

// access by index
let item1 : (String,Int) = ("food",3)
let item1Name : String = item1.0
let item1Quantity : Int = item1.1

// access by decomposing tuple
let (name1,quantity1) = item1
let (name,_) = item1
let (_,quantity) = item1

// access by naming tuple elements
let item2 = (itemName : "matches",itemQuantity: 10)
let item2Name = item2.itemName
let item2Quantity = item2.itemQuantity

// ******************************** Type Conversion ********************************
// Convert between primitive types, optionals, and strings and store results in new variable

// From numbers
// Can convert from lower-bit ints to higher-bit ints with no issues. When going the other way, must make sure value is still within lower-bit int range
// Decimal to non-decimal drops the decimal places
var int1 : Int = 500
var double1 : Double = Double(int1)
var float1 : Float = Float(40)
var int8 : Int8 = 45
int1 = Int(int8)
int1 = 500
//int8 = Int8(int1)         not allowed as 500 is well outside of the Int8 range
int1 = -500
//var uInt1 : UInt = UInt(int1)    not allowed as UInts can only represent positive numbers
double1 = 50.65
int1 = Int(double1)
int1 = 1

// From characters
//var char1 : Character = Character(int1)   not allowed
//var bool1 : Bool = Bool(432)  generally avoid doing this
var string1 : String = String(int1)

//var char1 : Character = "1"
string1 = String(char1)
//int1 = Int(char1) cannot do this

//var bool1 : Bool = false
//int1 = Int(bool1) cannot do this
string1 = String(bool1)

string1 = "32423"
int1 = Int(string1)!    // works only if string contains only numbers
string1 = "true"
bool1 = Bool(string1)!  // works only if string is true/false
string1 = "1"
char1 = Character(string1)

var string2 : String? = "Mammoth Interactive"
//string1 = string2!
string2 = string1

// ***************************** Operators part 1: *****************************
// Arithmetic, unary, and assignment operators
// Typically used to change or assign a value

// assignment: =
//var int1 : Int = 5
var int2 = int1

// arithmetic: +, -, *, /, %
var int3 = int1 + (int2 / 2)
var int4 : Int = int1 % 2
//var string1 = "Mammoth "
//var string2 = string1 + "Interactive"

// unary: +, -, !
var int5 = -int1
//var bool1 = !(true)

// combo assignment and arithmetic: +=, -=, *=, /=
int1 += 5   // int1 = int1 + 5
int1 /= 2

// ****************************** Operators part 2 ******************************
// Conditional testing, ternary, and nil-coalescing
// Typically test some condition and return result based on evaluation

// conditional: >, >=, <, <=, ==, !=, ===, !==
var isTrue : Bool = 5 == 4
var string1 : String = "hello"
isTrue = string1 > "goodbye"

// logical: &&, ||, !

// ternary: (a ? result_if_true : result_if_false)
//var int1 : Int = isTrue ? 20 : 30

// nil-coalescing: a ?? b
//var int2: Int? = nil
int1 = int2 ?? 10
