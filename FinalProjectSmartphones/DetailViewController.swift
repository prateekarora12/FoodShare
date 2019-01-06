//
//  DetailViewController.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 12/3/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var candyImageView: UIImageView!
    
    
    @IBOutlet weak var orderMealButton: UIButton!
    @IBOutlet weak var cookLabel: UILabel!
    
    @IBAction func orderMeal(_ sender: Any) {
//        cook?.cookOrderList.append(detailCandy!)
        user?.orderList.append(detailCandy!)
        //alert(message: "Meal successfully added to cart")
        
    }
    func alert(message: String){
        let alertController = UIAlertController(title: "Success", message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    @IBOutlet weak var priceLabel: UILabel!
//    @IBOutlet weak var addMealButton: UIButton!
    
    var cook : Cook?
    var user: User?
//    @IBOutlet weak var priceLabel: UILabel!
    var detailCandy: Meal? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let detailCandy = detailCandy {
            if let detailDescriptionLabel = detailDescriptionLabel, let candyImageView = candyImageView{
                print("indide detail")
                cook = detailCandy.preparedBy
                detailDescriptionLabel.text = detailCandy.name
                candyImageView.image = detailCandy.photo
                priceLabel.text = String(detailCandy.price)
                cookLabel.text = detailCandy.preparedBy?.firstName
                title = detailCandy.cuisine
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
  
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


