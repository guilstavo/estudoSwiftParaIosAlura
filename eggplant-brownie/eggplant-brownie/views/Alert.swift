//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Gustavo on 27/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    let controller:UIViewController
    init(controller:UIViewController){
        self.controller = controller
    }
    func show(message:String = "Unexpected error. Be careful."){
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "Understood", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(ok)
        controller.presentViewController(alert, animated: true, completion: nil)
    }
}