//
//  ChefLoginViewController.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 12/5/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class ChefLoginViewController: UIViewController {
    
    var cook:Cook?
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func login(_ sender: Any) {
        
        if let tempCook = GlobalVariables.cookList.first(where: { $0.phone == Int(emailField.text!) }) {
            print( tempCook.firstName )
            cook = tempCook
        } else {
           print("No cook found")
            
        }
        
        
       
      }
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
print("cooklogin segue called")
        if segue.identifier == "cookLogin"{
            let barViewControllers = segue.destination as! UITabBarController
            let nav = barViewControllers.viewControllers![1] as! UINavigationController
            let profilevc = barViewControllers.viewControllers![0] as! ChefProfileViewController
            let destinationvc = nav.topViewController as! MealTableViewController
            profilevc.cook = cook!
            destinationvc.cook = cook!
            print(GlobalVariables.mealList.count)
        }
        
    }

    func alert(message: String){
        let alertController = UIAlertController(title: "Error", message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        print("cooklogin segue called should perfrorm segue")
        if let ident = identifier {
            if ident == "cookLogin" {
                if cook == nil {
                    alert(message: "No user found, Plase sign in first!")
                    return false
                }
            }
        }
        return true
    }

}
