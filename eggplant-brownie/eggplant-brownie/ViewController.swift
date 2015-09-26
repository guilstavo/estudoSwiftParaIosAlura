//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Gustavo on 25/09/15.
//  Copyright © 2015 Gustavo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField:UITextField!
    @IBOutlet var happinessField:UITextField!
    
    @IBAction func add(){
        var name = nameField.text
        var happiness = happinessField.text
        print("eaten: \(name), \(happiness)")

    }


}

