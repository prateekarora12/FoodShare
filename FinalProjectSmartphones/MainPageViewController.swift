//
//  MainPageViewController.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 11/27/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {
    
   
    
    
    @IBOutlet var carouselView: iCarousel!
    var mealList = GlobalVariables.mealList
    
//    var numbers = [Int]()
    override func awakeFromNib() {
        super.awakeFromNib()
//         numbers = [1,2,3,4,5,6]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       carouselView.type = .coverFlow
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return mealList.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
//        return tempView
        var label: UILabel
        var titleLabel: UILabel
        var cookLabel: UILabel
        var priceLabel: UILabel
        
        var itemView: UIImageView
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200) )
        
        //reuse view if available, otherwise create a new view
        if let view = view as? UIImageView {
            itemView = view
            //get a reference to the label in the recycled view
            label = itemView.viewWithTag(1) as! UILabel
            titleLabel = itemView.viewWithTag(2) as! UILabel
            cookLabel = itemView.viewWithTag(3) as! UILabel
            priceLabel = itemView.viewWithTag(4) as! UILabel
            
        } else {
            //don't do anything specific to the index within
            //this `if ... else` statement because the view will be
            //recycled and used with other index values later
            
            //        //tempView.backgroundColor = UIColor.blue
            itemView = UIImageView(frame: CGRect(x: 0, y: -100, width: 200, height: 200))
            itemView.image = mealList[index].photo
            itemView.contentMode = .scaleAspectFit
            //itemView.center = .init(x: 0, y: )
            label = UILabel(frame: CGRect(x: 0,y: 150, width: 200, height: 200) )
            label.backgroundColor = UIColor.clear
            label.textAlignment = .center
            label.font = label.font.withSize(20)
            label.tag = 1
            itemView.addSubview(label)
            
            titleLabel = UILabel(frame: CGRect(x: 0,y: 200, width: 200, height: 200) )
            titleLabel.backgroundColor = UIColor.clear
            titleLabel.textAlignment = .center
            titleLabel.font = label.font.withSize(15)
            titleLabel.tag = 2
            itemView.addSubview(titleLabel)
            
            cookLabel = UILabel(frame: CGRect(x: 0,y: 225, width: 200, height: 200) )
            cookLabel.backgroundColor = UIColor.clear
            cookLabel.textAlignment = .center
            cookLabel.font = label.font.withSize(10)
            cookLabel.tag = 3
            itemView.addSubview(cookLabel)
            
            priceLabel = UILabel(frame: CGRect(x: 0,y: 250, width: 200, height: 200) )
            priceLabel.backgroundColor = UIColor.clear
            priceLabel.textAlignment = .center
            priceLabel.font = label.font.withSize(15)
            priceLabel.tag = 4
            itemView.addSubview(priceLabel)
            
            tempView.addSubview(itemView)
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        label.text = "\(mealList[index].name)"
        titleLabel.text = "Cuisine Type: \(mealList[index].cuisine!)"
        cookLabel.text = "Prepared By: \(mealList[index].preparedBy!.firstName)"
        priceLabel.text = "Price: $ \(mealList[index].price)"
        return tempView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat{
        if option == iCarouselOption.spacing{
           return value * 1.1
        }
        return value
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
