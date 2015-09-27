//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Gustavo on 26/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import Foundation

class Meal : NSObject, NSCoding{
    let name:String
    let happiness:Int
    var items = Array<Item>()
    init(name:String, happiness:Int){
        self.name = name
        self.happiness = happiness
    }
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.happiness = aDecoder.decodeIntegerForKey("happiness")
        self.items = aDecoder.decodeObjectForKey("items") as! Array
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeInteger(happiness, forKey: "happiness")
        aCoder.encodeObject(items, forKey: "items")
    }
    
    func allCallories() -> Double{
        var total = 0.0
        for item in items{
            total += item.calories
        }
        return total
    }
    func details() -> String{
        var message = "Happiness \(happiness)"
        
        for item in items{
            message += "\n * \(item.name) - \(item.calories) calories"
        }
        return message
    }
}