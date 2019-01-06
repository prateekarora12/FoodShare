//
//  ChefProfileViewController.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 12/2/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class ChefProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var cook:Cook?
    var orders: Array<Meal>?
    
    @IBAction func logout(_ sender: Any) {
        
    }
    
    @IBOutlet weak var cookLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = cook?.profilePicture
        tableView.dataSource = self
        orders = cook?.cookOrderList
        cookLabel.text = cook?.firstName
        
        // Do any additional setup after loading the view.
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
        return (orders!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = orders![indexPath.row].name
        cell.imageView?.image = orders![indexPath.row].photo
        cell.detailTextLabel?.text = "$ \(orders![indexPath.row].price)"
        return cell
        
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
