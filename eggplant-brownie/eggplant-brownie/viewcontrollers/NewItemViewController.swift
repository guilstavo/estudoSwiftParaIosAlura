//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Gustavo on 27/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var caloriesField:UITextField?
    
    @IBAction func addNewItem(){
        if nameField == nil || caloriesField == nil{
            return
        }
        let name = nameField!.text
        let calories = NSString(string: caloriesField!.text!).doubleValue
        
        let item = Item(name: name!, calories: calories)
        
        if let navigation = navigationController{
            navigation.popViewControllerAnimated(true)
        }
    }

}
