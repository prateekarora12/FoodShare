//
//  SearchMealTableViewCell.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 12/3/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class SearchMealTableViewCell: UITableViewCell {

    var mealIsAdded = false
    
    @IBOutlet weak var photoView: UIImageView!
    
    
   
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var cookLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    
  
    
//    @IBAction func addMeal(_ sender: Any) {
//
//        if (!mealIsAdded){
//            addMealButton.setTitle("Meal Added", for: .normal)
//            addMealButton.setTitleColor(orangeColor, for: .normal)
//            addMealButton.backgroundColor = .white
//            mealIsAdded = true
//        }else{
//            addMealButton.setTitle("Add Meal", for: .normal)
//            addMealButton.setTitleColor(.white, for: .normal)
//            addMealButton.backgroundColor = orangeColor
//            mealIsAdded = false
//        }
//    }
    

    
//    var orangeColor: UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        orangeColor = addMealButton.backgroundColor!
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
