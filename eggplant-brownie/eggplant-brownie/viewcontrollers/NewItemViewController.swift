//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Gustavo on 27/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import UIKit

protocol AddAnItemDelegate{
    func add(item:Item)
}
class NewItemViewController: UIViewController {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var caloriesField:UITextField?
    var delegate:AddAnItemDelegate?
    
    init(delegate:AddAnItemDelegate){
        self.delegate = delegate
        super.init(nibName: "NewItemViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func addNewItem(){
        if nameField == nil || caloriesField == nil{
            return
        }
        let name = nameField!.text
        let calories = NSString(string: caloriesField!.text!).doubleValue
        
        let item = Item(name: name!, calories: calories)
        if delegate == nil{
            return
        }
        delegate!.add(item)
        
        if let navigation = navigationController{
            navigation.popViewControllerAnimated(true)
        }
    }

}
