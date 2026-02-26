import UIKit

/*
 class: properties and methods
 */

/*
 1. Designated Initializer
 2. Convience Initializer -> secondary Init that calls a Designated Init, provide a default value
 3. Failable Initializer -> Can return nil when initialization fails
 4. Required Initializer -> Use in a inheritance Hierarchy
 */

class Person
{
    var age: Int
    var name: String
    
    //Designated Init
    init?(age: Int, name: String)
    {
        self.age = age
        self.name = name
        print(#function)
    }
    
    //Convience Init
    convenience init?()
    {
        guard !name.isEmpty, age > 0 else{return nil}
        
        self.init(age: 0, name: "Anonymous")
        print(#function)
    }
    convenience init?(name: String)
    {
        self.init(age: 0, name: name)
        print(#function)
    }
    convenience init?(name: String, using age: Int)
    {
        self.init(age: age, name: name)
        print(#function)
    }

    
    func display()
    {
        print("Name: \(name), Age: \(age)")
    }
}

var p1: Person = Person()
p1.display()
var p2: Person = Person(name: "John")
p2.display()
var p3: Person = Person(age: 30, name: "Bill")
p3.display()
