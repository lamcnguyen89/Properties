//
//  main.swift
//  Properties
//
//  Created by M_2022814 on 12/13/21.
//

import Foundation

// MARK: - Properties
// Properties associate values with a particular class, structure or enumeration.
// There are two types of properties: Stored and Computed
// Stored properties store constant and variable values as part of an instance
// Computed Properties  calculate rathe then store a values.
// Computed properties are provided by classes, structures and enumerations where store properties are only provided by classes and structures


// MARK: - Stored Properties
// Simply put, a stored property is a constant or variable that's stored as part of an instance of a particular class or structure.
var a = "Stored Property Variable"
let b = "Stored Property Constant"

// There are stored properties of constant structured instances.

// There are Lazy Stored Properties:
// Lazy stored properties are properties whose initial value isn't calculated until the first time it's used. This type of property is created to save computing power.
// THey are usually automatically initialized with the var keyword for an empty variable but constants cannot be empty.

struct DragonFire {
    lazy var lazyProp = "Some String"
}

// MARK: - Computed Properties
// Computed properties don't store a value. They provide a getter and optional setter to retrive and set other properties and values indirectly.

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
square.center = Point(x : 15.0, y: 15.0)

print("The square's origin is now at \(square.origin.x), \(square.origin.y)")

// MARK: - Read-Only Computed Properties
// Read-Only computed properties have a getter, but no setter.
// It always returns a value and can be accessed through dot syntax, but can't be set to different values

// MARK: - Property Observers
// Property observers observe and respond to changes in a proprty's value. A property observer is called every time a property's value is set.

// Property observers can be added to the following places:
    // Stored properties that you define
    // Stored properties that you inherit
    // Computed properties that you inherit

// The "willSet" keyword is called just before the value is stored.
// The "didSet" is called immediately after the new value is stored.


// MARK: - Property Wrappers
// Property wrappers add a layer of separation between code that manages how a property is stored and the code that defines the property.
// When you use a property wrapper, you write management code once when you define the wrapper, and then reuse the management code by applying it to multiple properties

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get {return number}
        set {number = min(newValue, 12)}
}
// The setter ensure that new values are less then 12 , and the getter returns the stored value
    
}

// You apply the property wrapper to a property by writing the wrapper's name before the proprty as an atribute
struct numberStructure {
    @TwelveOrLess var number : Int
}


// MARK: - Global and Local Variables
// Global Variables are variables defined outside a function, method, closure or type context
// Local variables are defined within a function, method, closure or type context

// MARK: - Type Properties
// Instance properties are properties that belong to an instance of a particular type.
// Everytime you create a new instance of that type, it has its own set of property values, separate from any other instance

// You define type properties with the static keyword

struct angelStruct {
    static var angel1 = "Ophanim"
    static var angel2 = "Seraphim"
}





