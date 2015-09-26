//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Gustavo on 25/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    
    @IBAction func add(){
        if nameField == nil || happinessField == nil{
            return
        }
        
        let name = nameField!.text
        let happiness = Int(happinessField!.text!)
        
        if happiness == nil{
            return
        }
        
        let meal = Meal(name: name!, happiness: happiness!)
        
        print("eaten: \(meal.name), \(meal.happiness)")

    }


}

