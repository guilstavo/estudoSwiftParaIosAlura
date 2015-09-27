//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Gustavo on 27/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import Foundation

class Dao{
    let mealsArchive:String
    let itemsArchive:String
    init(){
        let userDirs = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask,
            true)
        let dir = userDirs[ 0 ] as String
        mealsArchive = "\(dir)/eggplant-brownie-meals"
        itemsArchive = "\(dir)/eggplant-brownie-items"
    }
    
    func saveItems(items:Array<Item>){
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }
    
    func loadItems() -> Array<Item>{
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(itemsArchive) {
            return loaded as! Array
        }
        return Array<Item>()
    }
    
    func saveMeals(meals:Array<Meal>){
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
    func loadMeals() -> Array<Meal>{
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive) {
            return loaded as! Array
        }
        return Array<Meal>()
    }
}