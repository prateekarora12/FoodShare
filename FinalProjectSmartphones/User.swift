//
//  User.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 11/18/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var firstName: String
    var lastName: String
    var email: String
    var phone: Double
    var photo: UIImage?
//    var rating: Int = 5
    var orderList:Array<Meal> = []
   
    
    
    init(firstName: String, lastName: String, email:String, phone:Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        
        }
    
    
}
