//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Gustavo on 26/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import Foundation

class Meal{
    let name:String
    let happiness:Int
    var items = Array<Item>()
    init(name:String, happiness:Int){
        self.name = name
        self.happiness = happiness
    }
    func allCallories() -> Double{
        var total = 0.0
        for item in items{
            total += item.calories
        }
        return total
    }
}