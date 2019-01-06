import UIKit

class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchFooter: SearchFooter!
    var user: User?
    
    var detailViewController: DetailViewController? = nil
    var candies = [Meal]()
    var filteredCandies = [Meal]()
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.dataSource = self
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Meals"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["All", "American", "Indian", "Thai"]
        searchController.searchBar.delegate = self
        
        // Setup the search footer
        tableView.tableFooterView = searchFooter
        candies = GlobalVariables.mealList
//        candies = [
//            Candy(category:"Chocolate", name:"Chocolate Bar"),
//            Candy(category:"Chocolate", name:"Chocolate Chip"),
//            Candy(category:"Chocolate", name:"Dark Chocolate"),
//            Candy(category:"Hard", name:"Lollipop"),
//            Candy(category:"Hard", name:"Candy Cane"),
//            Candy(category:"Hard", name:"Jaw Breaker"),
//            Candy(category:"Other", name:"Caramel"),
//            Candy(category:"Other", name:"Sour Chew"),
//            Candy(category:"Other", name:"Gummi Bear"),
//            Candy(category:"Other", name:"Candy Floss"),
//            Candy(category:"Chocolate", name:"Chocolate Coin"),
//            Candy(category:"Chocolate", name:"Chocolate Egg"),
//            Candy(category:"Other", name:"Jelly Beans"),
//            Candy(category:"Other", name:"Liquorice"),
//            Candy(category:"Hard", name:"Toffee Apple")]
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if splitViewController!.isCollapsed {
            if let selectionIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectionIndexPath, animated: animated)
            }
        }
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            searchFooter.setIsFilteringToShow(filteredItemCount: filteredCandies.count, of: candies.count)
            return filteredCandies.count
        }
        
        searchFooter.setNotFiltering()
        return candies.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SearchMealTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchMealTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SearchMealTableViewCell.")
        }
        let candy: Meal
        if isFiltering() {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        cell.nameLabel.text = candy.name
        cell.priceLabel.text = String(candy.price)
        cell.cuisineLabel.text = candy.cuisine
        cell.cookLabel.text = candy.preparedBy?.firstName
        cell.photoView.image = candy.photo
        
        return cell
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let candy: Meal
                if isFiltering() {
                    candy = filteredCandies[indexPath.row]
                } else {
                    candy = candies[indexPath.row]
                }
                print("before detial segue, meal is \(candy.name)")
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.user = self.user
                controller.detailCandy = candy
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Private instance methods
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCandies = candies.filter({( candy : Meal) -> Bool in
            let doesCategoryMatch = (scope == "All") || (candy.cuisine == scope)
            
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && candy.name.lowercased().contains(searchText.lowercased())
            }
        })
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
}

extension MasterViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension MasterViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

