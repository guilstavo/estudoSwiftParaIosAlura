//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Gustavo on 25/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import UIKit

protocol AddAMealDelegate{
    func add(meal:Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    @IBOutlet var tableView:UITableView?
    var delegate:AddAMealDelegate?
    
    var items = [
        Item(name:"eggplant brownie", calories: 10),
        Item(name:"Zucchini Muffin", calories: 10),
        Item(name:"Cookie", calories: 10),
        Item(name:"Coconut oil", calories: 500),
        Item(name:"Chocolate frosting", calories: 1000),
        Item(name:"Chocolate chip", calories: 1000)
    ]
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(
            title: "New Item",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("showNewItem")
        )
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    func add(item: Item) {
        items.append(item)
        if let table = tableView{
            table.reloadData()
        }else{
            Alert(controller: self).show("Unexpectef error, but the item was added.")
        }
    }
    
    func showNewItem(){
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true)
        }else{
            Alert(controller: self).show()
        }
    }
    
    var selected = Array<Item>()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath){
            let item = items[indexPath.row]
            if (cell.accessoryType == UITableViewCellAccessoryType.None) {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                selected.append(item)
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.None
                if let position = selected.indexOf(item){
                    selected.removeAtIndex(position)
                }else{
                    Alert(controller: self).show()
                }
            }
        }else{
            Alert(controller: self).show()
        }

        
        
    }
    
    func getMealFromForm() -> Meal?{
        if nameField == nil || happinessField == nil{
            return nil
        }
        
        let name = nameField!.text
        let happiness = Int(happinessField!.text!)
        
        if happiness == nil{
            return nil
        }
        
        let meal = Meal(name: name!, happiness: happiness!)
        meal.items = selected
        print("eaten: \(meal.name), \(meal.happiness) \(meal.items)")
        return meal
    }
    
    @IBAction func add(){
        if let meal = getMealFromForm(){
            if let meals = delegate{
                meals.add(meal)
                if let navigation = self.navigationController{
                    navigation.popViewControllerAnimated(true)
                }else{
                    Alert(controller: self).show("Unexpected error. But the meal was added.")
                }
                return
            }
        }
        Alert(controller: self).show()
    }


}

