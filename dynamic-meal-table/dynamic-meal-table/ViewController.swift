//
//  ViewController.swift
//  dynamic-meal-table
//
//  Created by Gustavo on 26/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let meals = ["eggplant brownie", "zucchini muffin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal
        return cell
    }


}

