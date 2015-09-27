//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Gustavo on 26/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {

    var meals = [Meal(name: "eggplant brownie", happiness: 5), Meal(name: "zucchini muffin", happiness: 3)]
    
    func add(meal:Meal){
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal"{
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("showDetails:"))
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer){
        if recognizer.state == UIGestureRecognizerState.Began{
            let cell = recognizer.view as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            if indexPath == nil{
                return
            }
            let row = indexPath!.row
            let meal = meals[row]
            var message = "Happiness \(meal.happiness)"
            for item in meal.items{
                message += "\n * \(item.name) - \(item.calories) calories"
            }
            
            let details = UIAlertController(title: meal.name, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            details.addAction(ok)
            presentViewController(details, animated: true, completion: nil)
            
        }
    }
    
}
