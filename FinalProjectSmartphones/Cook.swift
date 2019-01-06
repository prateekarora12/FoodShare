//
//  Cook.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 11/18/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit
import os.log

class Cook: NSObject {
    
    
    var firstName: String
    var lastName: String?
    var email: String?
    var phone: Int?
    var profilePicture: UIImage?
    var mealList: Array<Meal> = []
    var cookOrderList: Array<Meal> = []
    
    init?(firstName: String, lastName: String?, profilePicture: UIImage?, email: String?, phone:Int?) {
        
        // The name must not be empty
        guard !firstName.isEmpty else {
            return nil
        }
        
        
        // Initialization should fail if there is no name or if the rating is negative.
        if firstName.isEmpty  {
            return nil
        }
        
        // Initialize stored properties.
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.profilePicture = profilePicture
        
    }
    
   
}


