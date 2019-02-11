//: Playground - noun: a place where people can play

import UIKit

// Intro to Classes
// What classes and objects are
// How to create and instantiate a new class

class GameCharacter {
    var name : String = ""
    
    init() {
        
    }
    
    init(_name : String) {
        self.name = _name
    }
}

let newCharacter : GameCharacter = GameCharacter()
let anotherCharacter : GameCharacter = GameCharacter(_name: "Nimish")

// Class properties part 1
// Basic fields/global variables
// How to set/retrieve values

class GameCharacter {
    var name : String
    var currentHP : Int = 100
    var inventory : [(String,Int)]
    
    init(_name : String) {
        self.name = _name
        inventory = [("shirt",1),("pants",1)]
    }
}

var newCharacter : GameCharacter = GameCharacter(_name: "Nimish")
var currentHP = newCharacter.currentHP
newCharacter.currentHP = 50
currentHP = 60
newCharacter.inventory.append(("knife",1))

// Class properties part 2
// Getters and setters
// Customize retrieval and resetting process

class GameCharacter {
    var name : String
    var currentHP : Int = 100
    var maxHP : Int = 100
    var inventory : [(String,Int)]
    
    init(_name : String) {
        self.name = _name
        inventory = [("shirt",1),("pants",1)]
    }
    
    func getCurrentHP() -> Int {
        if self.currentHP < 10 {
            print("Very low HP")
        } else if self.currentHP < 50 {
            print("Low HP")
        } else {
            print("High HP")
        }
        return self.currentHP
    }
    func setCurrentHP(newHP : Int) {
        if newHP > self.maxHP {
            self.currentHP = maxHP
        } else {
            self.currentHP = newHP
        }
    }
}

var newCharacter : GameCharacter = GameCharacter(_name: "Mammoth")
newCharacter.getCurrentHP()
newCharacter.setCurrentHP(newHP: 200)
newCharacter.currentHP

// Class properties part 3
// Calculated properties
// Read only properties and observers

class GameCharacter {
    var name : String
    var inventory : [(String,Int)]
    var inventoryCount : Int {
        var count : Int = 0
        for (_,quantity) in self.inventory {
            count += quantity
        }
        return count
    }
    var currentHP : Int = 100 {
        willSet {
            print("We are about to reset current HP value")
        }
        didSet(newCurrentHP) {
            if self.currentHP > self.maxHP {
                self.currentHP = self.maxHP
            } else {
                self.currentHP = newCurrentHP
            }
        }
    }
    var baseHP : Int = 100
    var bonusHP : Int = 50
    var maxHP : Int {
        get {
            return self.baseHP + self.bonusHP
        }
        set {
            self.baseHP = newValue - bonusHP
        }
    }
    
    init(_name : String) {
        self.name = _name
        inventory = [("shirt",1),("pants",1)]
    }
    
    func getCurrentHP() -> Int {
        if self.currentHP < 10 {
            print("Very low HP")
        } else if self.currentHP < 50 {
            print("Low HP")
        } else {
            print("High HP")
        }
        return self.currentHP
    }
    func setCurrentHP(newHP : Int) {
        if newHP > self.maxHP {
            self.currentHP = maxHP
        } else {
            self.currentHP = newHP
        }
    }
}

var newCharacter : GameCharacter = GameCharacter(_name: "Larry")
var maxhp = newCharacter.maxHP
var basehp = newCharacter.baseHP
newCharacter.maxHP = 200
maxhp = newCharacter.maxHP
basehp = newCharacter.baseHP
let count = newCharacter.inventoryCount

let currentHP = newCharacter.currentHP
newCharacter.currentHP = 250
newCharacter.currentHP

// Class properties part 5
// Last class properties section
// Lazy variables and static variables

class GameCharacter {
    var name : String
    var inventory : [(String,Int)]
    var inventoryCount : Int {
        var count : Int = 0
        for (_,quantity) in self.inventory {
            count += quantity
        }
        return count
    }
    lazy var equippedItem : String = "axe"
    var currentHP : Int = 100 {
        willSet {
            print("We are about to reset current HP value")
        }
        didSet(newCurrentHP) {
            if self.currentHP > self.maxHP {
                self.currentHP = self.maxHP
            }
        }
    }
    var baseHP : Int = 100
    var bonusHP : Int = 50
    var maxHP : Int {
        get {
            return self.baseHP + self.bonusHP
        }
        set {
            self.baseHP = newValue - bonusHP
        }
    }
    static var walkSpeed : Int = 1
    
    init(_name : String) {
        self.name = _name
        inventory = [("shirt",1),("pants",1),("axe",1)]
    }
    
    func getCurrentHP() -> Int {
        if self.currentHP < 10 {
            print("Very low HP")
        } else if self.currentHP < 50 {
            print("Low HP")
        } else {
            print("High HP")
        }
        return self.currentHP
    }
    func setCurrentHP(newHP : Int) {
        if newHP > self.maxHP {
            self.currentHP = maxHP
        } else {
            self.currentHP = newHP
        }
    }
}

var fred : GameCharacter = GameCharacter(_name: "Fred")
var george : GameCharacter = GameCharacter(_name: "George")
fred.currentHP = 50
fred.currentHP
george.currentHP
GameCharacter.walkSpeed = 2

// Class behaviour
// Basic methods and functions
// Implement and call upon them

class GameCharacter {
    var name : String
    var inventory : [(String,Int)]
    var inventoryCount : Int {
        var count : Int = 0
        for (_,quantity) in self.inventory {
            count += quantity
        }
        return count
    }
    lazy var equippedItem : String = "axe"
    var currentHP : Int = 100 {
        willSet {
            print("We are about to reset current HP value")
        }
        didSet(newCurrentHP) {
            if self.currentHP > self.maxHP {
                self.currentHP = self.maxHP
            }
        }
    }
    var baseHP : Int = 100
    var bonusHP : Int = 50
    var maxHP : Int {
        get {
            return self.baseHP + self.bonusHP
        }
        set {
            self.baseHP = newValue - bonusHP
        }
    }
    static var walkSpeed : Int = 1
    
    init(_name : String) {
        self.name = _name
        inventory = [("shirt",1),("pants",1),("axe",1)]
    }
    
    func getCurrentHP() -> Int {
        if self.currentHP < 10 {
            print("Very low HP")
        } else if self.currentHP < 50 {
            print("Low HP")
        } else {
            print("High HP")
        }
        return self.currentHP
    }
    func setCurrentHP(newHP : Int) {
        if newHP > self.maxHP {
            self.currentHP = maxHP
        } else {
            self.currentHP = newHP
        }
    }
    
    func addOneInventoryItem(newItem : String) {
        for itemIndex in self.inventory.indices {
            if self.inventory[itemIndex].0 == newItem {
                self.inventory[itemIndex].1 += 1
                return
            }
        }
        self.inventory.append((newItem,1))
    }
    
    func removeOneInventoryItem(itemToRemove : String) {
        for itemIndex in self.inventory.indices {
            if self.inventory[itemIndex].0 == itemToRemove {
                self.inventory[itemIndex].1 -= 1
                if self.inventory[itemIndex].1 == 0 {
                    self.inventory.remove(at: itemIndex)
                }
                return
            }
        }
    }
}

let newCharacter : GameCharacter = GameCharacter(_name: "Character name")
newCharacter.inventory
newCharacter.addOneInventoryItem(newItem: "shirt")
newCharacter.addOneInventoryItem(newItem: "gloves")
newCharacter.inventory
newCharacter.removeOneInventoryItem(itemToRemove: "shirt")
newCharacter.removeOneInventoryItem(itemToRemove: "axe")
newCharacter.inventory

// Class behaviour part 2
// Class methods
// Combine static concept with instance methods

class GameCharacter {
    var name : String
    var inventory : [(String,Int)]
    var inventoryCount : Int {
        var count : Int = 0
        for (_,quantity) in self.inventory {
            count += quantity
        }
        return count
    }
    lazy var equippedItem : String = "axe"
    var currentHP : Int = 100 {
        willSet {
            print("We are about to reset current HP value")
        }
        didSet(newCurrentHP) {
            if self.currentHP > self.maxHP {
                self.currentHP = self.maxHP
            }
        }
    }
    var baseHP : Int = 100
    var bonusHP : Int = 50
    var maxHP : Int {
        get {
            return self.baseHP + self.bonusHP
        }
        set {
            self.baseHP = newValue - bonusHP
        }
    }
    static var walkSpeed : Int = 1
    
    init(_name : String) {
        self.name = _name
        inventory = [("shirt",1),("pants",1),("axe",1)]
    }
    
    func getCurrentHP() -> Int {
        if self.currentHP < 10 {
            print("Very low HP")
        } else if self.currentHP < 50 {
            print("Low HP")
        } else {
            print("High HP")
        }
        return self.currentHP
    }
    func setCurrentHP(newHP : Int) {
        if newHP > self.maxHP {
            self.currentHP = maxHP
        } else {
            self.currentHP = newHP
        }
    }
    
    func addOneInventoryItem(newItem : String) {
        for itemIndex in self.inventory.indices {
            if self.inventory[itemIndex].0 == newItem {
                self.inventory[itemIndex].1 += 1
                return
            }
        }
        self.inventory.append((newItem,1))
    }
    
    func removeOneInventoryItem(itemToRemove : String) {
        for itemIndex in self.inventory.indices {
            if self.inventory[itemIndex].0 == itemToRemove {
                self.inventory[itemIndex].1 -= 1
                if self.inventory[itemIndex].1 == 0 {
                    self.inventory.remove(at: itemIndex)
                }
                return
            }
        }
    }
    
    class func speedUpWalkingPace(speedMultiplier : Int) {
        self.walkSpeed *= speedMultiplier
    }
    
    class func slowDownWalkingPace(speedDivisor : Int) {
        self.walkSpeed /= speedDivisor
    }
}

GameCharacter.speedUpWalkingPace(speedMultiplier: 2)
GameCharacter.slowDownWalkingPace(speedDivisor: 2)
GameCharacter.walkSpeed

// Instantiating classes within a class
// Every class must be instatiated within an existing class
// Classes can store instances as variables

class GameMap {
    var playerCharacter : GameCharacter
    var nonPlayerCharacters : [GameCharacter]
    
    init(playerCharacterName : String) {
        playerCharacter = GameCharacter(_name: playerCharacterName)
        
        let villager : GameCharacter = GameCharacter(_name: "Villager")
        nonPlayerCharacters = [villager,villager,villager]
    }
}

let newMap : GameMap = GameMap(playerCharacterName: "Nimish")
let playerInventory = newMap.playerCharacter.inventory

// Inheritance part 1
// Intro to the concept of subclasses and superclasses
// Create a subclass of GameCharacter

class PlayerCharacter : GameCharacter {
    var money : Int = 100
    
    func buyOneItem(itemName : String, itemValue : Int) {
        if itemValue <= money {
            addOneInventoryItem(newItem: itemName)
            money -= itemValue
        } else {
            print("Not enough money")
        }
    }
    
    func sellOneItem(itemName : String, itemValue : Int) {
        if removeOneInventoryItem(itemToRemove: itemName) == true {
            money += itemValue
        } else {
            print("Could not sell item")
        }
    }
}

class GameMap {
    var playerCharacter : PlayerCharacter
    var nonPlayerCharacters : [GameCharacter]
    
    init(playerCharacterName : String) {
        //playerCharacter = GameCharacter(_name: playerCharacterName) as! PlayerCharacter
        playerCharacter = PlayerCharacter(_name: playerCharacterName)
        playerCharacter.currentHP = 50
        playerCharacter.addOneInventoryItem(newItem: "knife")
        
        let villager : GameCharacter = GameCharacter(_name: "Villager")
        nonPlayerCharacters = [villager,villager,villager]
    }
}

let playerCharacter1 : PlayerCharacter = PlayerCharacter(_name: "name")
playerCharacter1.inventory
playerCharacter1.money
playerCharacter1.sellOneItem(itemName: "axe", itemValue: 50)
playerCharacter1.money

let gameCharacter1 : GameCharacter = GameCharacter(_name: "name")

// Inheritance part 2
// Overriding and super keyword
// Override initializers for subclass

class GameCharacter {
    var name : String
    var inventory : [(String,Int)]
    var inventoryCount : Int {
        var count : Int = 0
        for (_,quantity) in self.inventory {
            count += quantity
        }
        return count
    }
    lazy var equippedItem : String = "axe"
    var currentHP : Int = 100 {
        willSet {
            print("We are about to reset current HP value")
        }
        didSet(newCurrentHP) {
            if self.currentHP > self.maxHP {
                self.currentHP = self.maxHP
            }
        }
    }
    var baseHP : Int = 100
    var bonusHP : Int = 50
    var maxHP : Int {
        get {
            return self.baseHP + self.bonusHP
        }
        set {
            self.baseHP = newValue - bonusHP
        }
    }
    static var walkSpeed : Int = 1
    
    init(_name : String, startingItems : [(String,Int)]) {
        self.name = _name
        inventory = startingItems
    }
    
    func getCurrentHP() -> Int {
        if self.currentHP < 10 {
            print("Very low HP")
        } else if self.currentHP < 50 {
            print("Low HP")
        } else {
            print("High HP")
        }
        return self.currentHP
    }
    func setCurrentHP(newHP : Int) {
        if newHP > self.maxHP {
            self.currentHP = maxHP
        } else {
            self.currentHP = newHP
        }
    }
    
    func addOneInventoryItem(newItem : String) {
        for itemIndex in self.inventory.indices {
            if self.inventory[itemIndex].0 == newItem {
                self.inventory[itemIndex].1 += 1
                return
            }
        }
        self.inventory.append((newItem,1))
    }
    
    func removeOneInventoryItem(itemToRemove : String) -> Bool {
        for itemIndex in self.inventory.indices {
            if self.inventory[itemIndex].0 == itemToRemove {
                self.inventory[itemIndex].1 -= 1
                if self.inventory[itemIndex].1 == 0 {
                    self.inventory.remove(at: itemIndex)
                }
                return true
            }
        }
        return false
    }
    
    class func speedUpWalkingPace(speedMultiplier : Int) {
        self.walkSpeed *= speedMultiplier
    }
    
    class func slowDownWalkingPace(speedDivisor : Int) {
        self.walkSpeed /= speedDivisor
    }
}

class PlayerCharacter : GameCharacter {
    var money : Int = 100
    
    override init(_name: String, startingItems: [(String, Int)]) {
        super.init(_name: _name, startingItems: startingItems)
        self.money = 200
    }
    
    init(_name: String, startingItems: [(String,Int)], startingMoney : Int) {
        super.init(_name: _name, startingItems: startingItems)
        self.money = startingMoney
    }
    
    func buyOneItem(itemName : String, itemValue : Int) {
        if itemValue <= money {
            addOneInventoryItem(newItem: itemName)
            money -= itemValue
        } else {
            print("Not enough money")
        }
    }
    
    func sellOneItem(itemName : String, itemValue : Int) {
        if removeOneInventoryItem(itemToRemove: itemName) == true {
            money += itemValue
        } else {
            print("Could not sell item")
        }
    }
}

class GameMap {
    var playerCharacter : PlayerCharacter
    var nonPlayerCharacters : [GameCharacter]
    
    init(playerCharacterName : String) {
        //playerCharacter = GameCharacter(_name: playerCharacterName) as! PlayerCharacter
        playerCharacter = PlayerCharacter(_name: playerCharacterName, startingItems : [("shirt",1),("pants",1),("axe",1)])
        playerCharacter.currentHP = 50
        playerCharacter.addOneInventoryItem(newItem: "knife")
        
        let villager : GameCharacter = GameCharacter(_name: "Villager", startingItems : [("shirt",1),("pants",1)])
        nonPlayerCharacters = [villager,villager,villager]
    }
}

var playerCharacter1 = PlayerCharacter(_name: "new name", startingItems : [("shirt",1),("pants",1),("axe",1)])
playerCharacter1.name
playerCharacter1.money
var playerCharacter2 = PlayerCharacter(_name: "new name", startingItems : [("shirt",1),("pants",1),("axe",1)], startingMoney : 300)
playerCharacter2.money

// Inheritance part 3
// Overriding superclass properties
// Change read/write properties and observers

class GameCharacter {
    var name : String
    var inventory : [(String,Int)]
    var inventoryCount : Int {
        var count : Int = 0
        for (_,quantity) in self.inventory {
            count += quantity
        }
        return count
    }
    lazy var equippedItem : String = "axe"
    var currentHP : Int = 100 {
        willSet {
            print("We are about to reset current HP value")
        }
        didSet(newCurrentHP) {
            if self.currentHP > self.maxHP {
                self.currentHP = self.maxHP
            }
        }
    }
    var baseHP : Int = 100
    var bonusHP : Int = 50
    var maxHP : Int {
        get {
            return self.baseHP + self.bonusHP
        }
        set {
            self.baseHP = newValue - bonusHP
        }
    }
    var equippedTool : String? {
        if self.inventory.isEmpty == false {
            return self.inventory[0].0
        } else {
            return nil
        }
    }
    static var walkSpeed : Int = 1
    
    init(_name : String, startingItems : [(String,Int)]) {
        self.name = _name
        inventory = startingItems
    }
    
    func getCurrentHP() -> Int {
        if self.currentHP < 10 {
            print("Very low HP")
        } else if self.currentHP < 50 {
            print("Low HP")
        } else {
            print("High HP")
        }
        return self.currentHP
    }
    func setCurrentHP(newHP : Int) {
        if newHP > self.maxHP {
            self.currentHP = maxHP
        } else {
            self.currentHP = newHP
        }
    }
    
    func addOneInventoryItem(newItem : String) {
        for itemIndex in self.inventory.indices {
            if self.inventory[itemIndex].0 == newItem {
                self.inventory[itemIndex].1 += 1
                return
            }
        }
        self.inventory.append((newItem,1))
    }
    
    func removeOneInventoryItem(itemToRemove : String) -> Bool {
        for itemIndex in self.inventory.indices {
            if self.inventory[itemIndex].0 == itemToRemove {
                self.inventory[itemIndex].1 -= 1
                if self.inventory[itemIndex].1 == 0 {
                    self.inventory.remove(at: itemIndex)
                }
                return true
            }
        }
        return false
    }
    
    class func speedUpWalkingPace(speedMultiplier : Int) {
        self.walkSpeed *= speedMultiplier
    }
    
    class func slowDownWalkingPace(speedDivisor : Int) {
        self.walkSpeed /= speedDivisor
    }
}

class PlayerCharacter : GameCharacter {
    var money : Int = 100
    override var equippedTool: String? {
        get {
            return self.inventory.first?.0
        }
        set(newTool) {
            self.inventory.insert((newTool!,1), at: 0)
        }
    }
    override var baseHP: Int {
        didSet(newHPValue) {
            print("Our character now has \(super.baseHP - newHPValue) more HP than other characters")
        }
    }
    
    override init(_name: String, startingItems: [(String, Int)]) {
        super.init(_name: _name, startingItems: startingItems)
        self.money = 200
        self.currentHP = 120
    }
    
    init(_name: String, startingItems: [(String,Int)], startingMoney : Int) {
        super.init(_name: _name, startingItems: startingItems)
        self.money = startingMoney
    }
    
    func buyOneItem(itemName : String, itemValue : Int) {
        if itemValue <= money {
            addOneInventoryItem(newItem: itemName)
            money -= itemValue
        } else {
            print("Not enough money")
        }
    }
    
    func sellOneItem(itemName : String, itemValue : Int) {
        if removeOneInventoryItem(itemToRemove: itemName) == true {
            money += itemValue
        } else {
            print("Could not sell item")
        }
    }
}

class GameMap {
    var playerCharacter : PlayerCharacter
    var nonPlayerCharacters : [GameCharacter]
    
    init(playerCharacterName : String) {
        //playerCharacter = GameCharacter(_name: playerCharacterName) as! PlayerCharacter
        playerCharacter = PlayerCharacter(_name: playerCharacterName, startingItems : [("axe",1),("shirt",1),("pants",1)])
        playerCharacter.currentHP = 50
        playerCharacter.addOneInventoryItem(newItem: "knife")
        
        let villager : GameCharacter = GameCharacter(_name: "Villager", startingItems : [("knife",1),("shirt",1),("pants",1)])
        nonPlayerCharacters = [villager,villager,villager]
    }
}

var newPlayerCharacter = PlayerCharacter(_name: "new name", startingItems: [("axe",1),("gloves",2),("pants",1)])
newPlayerCharacter.equippedTool = "knife"
newPlayerCharacter.inventory
newPlayerCharacter.baseHP = 300

// Inheritance part 4
// Overriding superclass methods
// Provide new method implementation

class GameCharacter {
    var name : String
    var inventory : [(String,Int)]
    var inventoryCount : Int {
        var count : Int = 0
        for (_,quantity) in self.inventory {
            count += quantity
        }
        return count
    }
    lazy var equippedItem : String = "axe"
    var currentHP : Int = 100 {
        willSet {
            print("We are about to reset current HP value")
        }
        didSet(newCurrentHP) {
            if self.currentHP > self.maxHP {
                self.currentHP = self.maxHP
            }
        }
    }
    var baseHP : Int = 100
    var bonusHP : Int = 50
    var maxHP : Int {
        get {
            return self.baseHP + self.bonusHP
        }
        set {
            self.baseHP = newValue - bonusHP
        }
    }
    var equippedTool : String? {
        if self.inventory.isEmpty == false {
            return self.inventory[0].0
        } else {
            return nil
        }
    }
    var xPos : Int
    var yPos : Int
    static var walkSpeed : Int = 1
    
    init(_name : String, startingItems : [(String,Int)]) {
        self.name = _name
        inventory = startingItems
        xPos = 0
        yPos = 0
    }
    
    func getCurrentHP() -> Int {
        if self.currentHP < 10 {
            print("Very low HP")
        } else if self.currentHP < 50 {
            print("Low HP")
        } else {
            print("High HP")
        }
        return self.currentHP
    }
    func setCurrentHP(newHP : Int) {
        if newHP > self.maxHP {
            self.currentHP = maxHP
        } else {
            self.currentHP = newHP
        }
    }
    
    func addOneInventoryItem(newItem : String) {
        for itemIndex in self.inventory.indices {
            if self.inventory[itemIndex].0 == newItem {
                self.inventory[itemIndex].1 += 1
                return
            }
        }
        self.inventory.append((newItem,1))
    }
    
    func removeOneInventoryItem(itemToRemove : String) -> Bool {
        for itemIndex in self.inventory.indices {
            if self.inventory[itemIndex].0 == itemToRemove {
                self.inventory[itemIndex].1 -= 1
                if self.inventory[itemIndex].1 == 0 {
                    self.inventory.remove(at: itemIndex)
                }
                return true
            }
        }
        return false
    }
    
    func moveCharacter(byXAmount xAmount : Int, byYAmount yAmount : Int) {
        self.xPos += xAmount * GameCharacter.walkSpeed
        self.yPos += yAmount * GameCharacter.walkSpeed
    }
    
    class func speedUpWalkingPace(speedMultiplier : Int) {
        self.walkSpeed *= speedMultiplier
    }
    
    class func slowDownWalkingPace(speedDivisor : Int) {
        self.walkSpeed /= speedDivisor
    }
}

class PlayerCharacter : GameCharacter {
    var money : Int = 100
    override var equippedTool: String? {
        get {
            return self.inventory.first?.0
        }
        set(newTool) {
            self.inventory.insert((newTool!,1), at: 0)
        }
    }
    override var baseHP: Int {
        didSet(newHPValue) {
            print("Our character now has \(super.baseHP - newHPValue) more HP than other characters")
        }
    }
    var runSpeed : Int = 2
    var isRunning : Bool = true
    
    override init(_name: String, startingItems: [(String, Int)]) {
        super.init(_name: _name, startingItems: startingItems)
        self.money = 200
        self.currentHP = 120
    }
    
    init(_name: String, startingItems: [(String,Int)], startingMoney : Int) {
        super.init(_name: _name, startingItems: startingItems)
        self.money = startingMoney
    }
    
    func buyOneItem(itemName : String, itemValue : Int) {
        if itemValue <= money {
            addOneInventoryItem(newItem: itemName)
            money -= itemValue
        } else {
            print("Not enough money")
        }
    }
    
    func sellOneItem(itemName : String, itemValue : Int) {
        if removeOneInventoryItem(itemToRemove: itemName) == true {
            money += itemValue
        } else {
            print("Could not sell item")
        }
    }
    
    override func moveCharacter(byXAmount xAmount: Int, byYAmount yAmount: Int) {
        if self.isRunning == true {
            super.moveCharacter(byXAmount: xAmount * self.runSpeed, byYAmount: yAmount * self.runSpeed)
        } else {
            super.moveCharacter(byXAmount: xAmount, byYAmount: yAmount)
        }
    }
}

class GameMap {
    var playerCharacter : PlayerCharacter
    var nonPlayerCharacters : [GameCharacter]
    
    init(playerCharacterName : String) {
        //playerCharacter = GameCharacter(_name: playerCharacterName) as! PlayerCharacter
        playerCharacter = PlayerCharacter(_name: playerCharacterName, startingItems : [("axe",1),("shirt",1),("pants",1)])
        playerCharacter.currentHP = 50
        playerCharacter.addOneInventoryItem(newItem: "knife")
        
        let villager : GameCharacter = GameCharacter(_name: "Villager", startingItems : [("knife",1),("shirt",1),("pants",1)])
        nonPlayerCharacters = [villager,villager,villager]
    }
}

var playerCharacter = PlayerCharacter(_name: "Larry", startingItems: [])
var gameCharacter = GameCharacter(_name: "Harry", startingItems: [])
playerCharacter.xPos
playerCharacter.yPos
playerCharacter.moveCharacter(byXAmount: 2, byYAmount: 2)
playerCharacter.xPos
playerCharacter.yPos

gameCharacter.xPos
gameCharacter.yPos
gameCharacter.moveCharacter(byXAmount: 2, byYAmount: 2)
gameCharacter.xPos
gameCharacter.yPos

// Structs
// Implementing structs
// Creating new structs and accessing properties

struct InventoryItem {
    var name : String
    var quantity : Int = 1
    var category : String
    var value : Int
    static var startingQuantity : Int = 1
    
    init(_name : String, _category: String, _value : Int) {
        self.name = _name
        self.category = _category
        self.value = _value
    }
    
    func getValue() -> Int {
        return self.value
    }
    
    mutating func increaseQuantity(byAmount newAmount : Int) {
        self.quantity += newAmount
    }
    
    mutating func decreaseQuantity(byAmount newAmount : Int) {
        self.quantity -= newAmount
    }
    
    mutating func changeItem(_name : String, _category: String, _value : Int) {
        self = InventoryItem(_name: _name, _category: _category, _value: _value)
    }
    
    static func changeStartingAmount(newAmount : Int) {
        self.startingQuantity = newAmount
    }
}

var knife : InventoryItem = InventoryItem(_name: "knife", _category: "equip", _value: 20)
knife.name
knife.value = 30
knife.getValue()
knife.increaseQuantity(byAmount: 2)
InventoryItem.startingQuantity

// Enumerations
// Define a common type for related values
// Allows us to defer from the built in Swift types

enum ItemCategory : String {
    case equipable
    case wearable
    case consumable
    case usable
}

var itemCategory : ItemCategory = ItemCategory.usable
itemCategory = .wearable
var otherItemCategory : ItemCategory? = ItemCategory(rawValue: "usable")

itemCategory.rawValue

switch (itemCategory) {
case ItemCategory.equipable:
    print("item can be equipped")
case ItemCategory.wearable:
    print("item can be worn")
case ItemCategory.consumable:
    print("item can be consumed")
case ItemCategory.usable:
    print("item can be used")
}

enum ItemCat{
    case equipable(Bool,Bool)
    case wearable
    case consumable
    case usable
}

var itemCat = ItemCat.equipable(false, true)

// Compare classes, structs, and enums
// Similarities and differences
// When and where to use each one

class A {
    var propertyA : String = "hello"
}

struct B {
    var propertyB : String = "goodbye"
}

var a1 = A()
var a2 = A()
a1.propertyA = "hi"
a1.propertyA
a2.propertyA
a1 = a2
a1.propertyA = "hey"
a1.propertyA
a2.propertyA

var b1 = B()
var b2 = B()
b1.propertyB = "bye"
b1.propertyB
b2.propertyB
b1 = b2
b1.propertyB = "bye"
b1.propertyB
b2.propertyB
