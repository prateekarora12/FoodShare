//
//  UserList.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 11/19/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import Foundation

struct GlobalVariables {
    static var userList: Array<User> = []
    static var cookList: Array<Cook> = []
    
    static var tempCook = Cook(firstName: "Test CookName", lastName: "test", profilePicture: #imageLiteral(resourceName: "defaultCook"), email: "uehf", phone: 2345)
    
    static var mealList: Array<Meal>  = [Meal(name: "Caprese Salad", cuisine: "American",  photo: UIImage(named: "meal10"), price: 24.0, preparedBy: tempCook )!, Meal(name: "Chicken and Potatoes", cuisine: "American", photo: UIImage(named: "meal2"), price: 24.0, preparedBy: tempCook)!,Meal(name: "Pasta with Meatballs", cuisine: "American", photo: UIImage(named: "meal3"), price: 24.0, preparedBy: tempCook)!, Meal(name: "Veggie Burgers", cuisine: "American", photo: UIImage(named: "meal4"), price: 10.0, preparedBy: tempCook)!,Meal(name: "Veggie Pizza", cuisine: "Indian", photo: UIImage(named: "meal5"), price: 10.0, preparedBy: tempCook)!, Meal(name: "Thai Salad ", cuisine: "Thai", photo: UIImage(named: "meal9"), price: 24.0, preparedBy: tempCook)!, Meal(name: "Pasta with Meatballs", cuisine: "Italian", photo: UIImage(named: "meal7"), price: 24.0, preparedBy: tempCook)!, Meal(name: "Chicken Katsu", cuisine: "Indian", photo: UIImage(named: "meal8"), price: 8.0, preparedBy: tempCook)! ]
    
}
