//
//  SelectCuisineViewController.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 11/20/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class SelectCuisineViewController: UITableViewController, UISplitViewControllerDelegate{
    
    var user:User?

    // MARK: -  struct for cell item
    struct CellItem {
        var name : String
        var isSelected:Bool = false
        init(name: String) {
            self.name = name
        }
    }
    

    
    var favouriteCuisines: Array<String> = []
    var cellData: [CellItem] = [CellItem(name: "American"),CellItem(name: "Chinese"),CellItem(name: "English"),CellItem(name: "French"), CellItem(name: "German"), CellItem(name: "Indian"), CellItem(name: "Japanese"),CellItem(name: "Vietnamese"), CellItem(name: "Thai"), CellItem(name: "French")]
    var isSelectAllSelected : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else
        {
            return cellData.count
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: -  Table view delegates
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "Select All"
            if isSelectAllSelected{
                cell.accessoryType = .checkmark
                
            }
            else{
                cell.accessoryType = .none
                
            }
            
        }
        else
        {
            cell.textLabel?.text = cellData[indexPath.row].name
            if cellData[indexPath.row].isSelected{
                cell.accessoryType = .checkmark
                
            }
            else{
                cell.accessoryType = .none
            }
            
        }
        return cell
    }
    
    
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0
        {
         
            cellData[indexPath.row].isSelected = !cellData[indexPath.row].isSelected
            isSelectAllSelected = cellData[indexPath.row].isSelected
            for index in cellData.indices
            {
                cellData[index].isSelected = cellData[indexPath.row].isSelected
            }
        }
        else
        {
           
            cellData[indexPath.row].isSelected = !cellData[indexPath.row].isSelected
            if cellData.filter({ $0.isSelected }).count == cellData.count
            {
                isSelectAllSelected = true
            }
            else
            {
                isSelectAllSelected = false
            }
            
        }
        
       
        var tempFavouriteCuisines:Array<String> = []
        self.tableView.reloadData()
        for cell in cellData{
            if (cell.isSelected == true){
                tempFavouriteCuisines.append(cell.name)
            }
        }
        favouriteCuisines = tempFavouriteCuisines
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("cuisine segue called and user is \(String(describing: user?.firstName))")
//        let barViewControllers = segue.destination as! UITabBarController
//        let navvc = barViewControllers.viewControllers![2] as! UINavigationController
//        let destinationvc = navvc.topViewController as! SearchTableViewController
//        destinationvc.user = self.user
        let barViewControllers = segue.destination as! UITabBarController
        let splitViewController = barViewControllers.viewControllers![2] as! UISplitViewController
        let userProfilevc = barViewControllers.viewControllers![1] as! UserOrderlistViewController
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
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
 

}
