//
//  ViewController.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 11/18/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(GlobalVariables.mealList.count)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwindToMainMenu(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ChefProfileViewController {
            print("logged out")
            print(GlobalVariables.mealList.count)
        }
    }
    


}

