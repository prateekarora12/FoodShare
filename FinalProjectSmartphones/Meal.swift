//
//  Meal.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 11/10/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit
import os.log


class Meal: NSObject {
    
    //MARK: Properties
    
    var name: String
    var cuisine: String?
    var photo: UIImage?
    var price: Double
    var preparedBy: Cook?
    
   
    
    //MARK: Initialization
    
    init?(name: String, cuisine: String?, photo: UIImage?, price: Double, preparedBy:Cook?) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty  {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.cuisine = cuisine
        self.photo = photo
        self.price = price
        self.preparedBy = preparedBy

        
    }
    
 
    
    
}

