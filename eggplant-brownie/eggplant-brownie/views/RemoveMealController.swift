//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Gustavo on 27/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController{
    let controller: UIViewController
    init(controller:UIViewController){
        self.controller = controller
    }
    func show(meal:Meal, handler:((UIAlertAction!) -> Void)){
        var message = "Happiness \(meal.happiness)"
        for item in meal.items{
            message += "\n * \(item.name) - \(item.calories) calories"
        }
        
        let details = UIAlertController(title: meal.name, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let remove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.Destructive, handler: handler)
        details.addAction(remove)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        details.addAction(cancel)
        controller.presentViewController(details, animated: true, completion: nil)
    }
}
