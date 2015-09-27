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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
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
    
    func showNewItem(){
        let newItem = NewItemViewController(nibName: "NewItemViewController", bundle: nil)
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true)
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
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell == nil{
            return
        }
        let item = items[indexPath.row]
        if (cell!.accessoryType == UITableViewCellAccessoryType.None) {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(item)
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.None
            if let position = selected.indexOf(item){
                selected.removeAtIndex(position)
            }

        }
    }
    
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
        meal.items = selected
        print("eaten: \(meal.name), \(meal.happiness) \(meal.items)")
        
        if delegate == nil{
            return
        }
        delegate!.add(meal)
        
        if let navigation = self.navigationController{
            navigation.popViewControllerAnimated(true)
        }

    }


}

