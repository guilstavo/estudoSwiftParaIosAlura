//: Playground - noun: a place where people can play

import UIKit

class Meal{
    var name:String?
    var happiness:Int?
    
}

let brownie = Meal()
brownie.name = "eggplant"
brownie.happiness = 5
print(brownie.name)
print(brownie.happiness)

var name:String!

name = "brownie"
if let n = name{
    print(n.characters.count)
}else{
    print("empty")
}


var name2 = "abobrinha"
print(name2.characters.count)
