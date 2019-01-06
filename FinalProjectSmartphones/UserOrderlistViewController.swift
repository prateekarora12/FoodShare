//
//  UserOrderlistViewController.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 12/4/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class UserOrderlistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var user:User?
//    var tempCook = Cook(firstName: "defaultCookName", lastName: "test", profilePicture: #imageLiteral(resourceName: "defaultCook"), email: "uehf", phone: 2345)
    
    @IBAction func logout(_ sender: Any) {
    }

//    var orders:Array<Meal> = []
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func placeOrder(_ sender: Any) {
//        print(user?.orderList.count)
        for order in (user?.orderList)! {
            order.preparedBy?.cookOrderList.append(order)
        }
        alert(message: "Your order is placed! ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        photoView.image = user?.photo
        nameLabel.text = user?.firstName
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (user?.orderList.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = user?.orderList[indexPath.row].name
        cell.imageView?.image = user?.orderList[indexPath.row].photo
        cell.detailTextLabel?.text = "$ \(String(describing: user?.orderList[indexPath.row].price))"
        return cell
        
    }
    func alert(message: String){
        let alertController = UIAlertController(title: "Success", message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func unwindToUserMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? DetailViewController, let meal = sourceViewController.detailCandy {
//                orders.append(meal)
                user?.orderList.append(meal)
            tableView.reloadData()
            alert(message: "Meal added to order successfully")
            
            
            // Save the meals.
        }
    }
        
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
