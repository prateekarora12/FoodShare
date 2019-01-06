//
//  UserLoginViewController.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 12/6/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController, UISplitViewControllerDelegate {
    
    var user:User?
    

    @IBOutlet weak var phoneField: UITextField!
    
    @IBAction func login(_ sender: Any) {
        if let tempUser = GlobalVariables.userList.first(where: { $0.phone == Double(phoneField.text!) }) {
            print( tempUser.firstName )
            user = tempUser
        } else {
            print("No User found")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userLogin"{
            print("Userlogin segue called")
            let barViewControllers = segue.destination as! UITabBarController
            let userProfilevc = barViewControllers.viewControllers![1] as! UserOrderlistViewController
            let carouselvc = barViewControllers.viewControllers![0] as! MainPageViewController
            let  splitViewController = barViewControllers.viewControllers![2] as! UISplitViewController
            
            userProfilevc.user = user
            //        let splitViewController = navvc.topViewController as! UISplitViewController
            let navigationController = splitViewController.viewControllers[0] as! UINavigationController
            navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            splitViewController.preferredDisplayMode = .allVisible
            splitViewController.delegate = self
            let rightNavController = splitViewController.viewControllers.last as? UINavigationController
            let detailViewController = rightNavController?.topViewController as? DetailViewController
            detailViewController?.navigationItem.leftItemsSupplementBackButton = true
            detailViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            UISearchBar.appearance().tintColor = .candyGreen
            UINavigationBar.appearance().tintColor = .candyGreen
        }
        
        
        
    }
    
    func alert(message: String){
        let alertController = UIAlertController(title: "Error", message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        print("userlogin segue called should perfrorm segue")
        if let ident = identifier {
            if ident == "userLogin" {
                if user == nil {
                    alert(message: "No user found, Plase sign in first!")
                    return false
                }
            }
        }
        return true
    }
 

}
