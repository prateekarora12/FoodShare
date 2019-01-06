//
//  AddUserViewController.swift
//  FinalProjectSmartphones
//
//  Created by Prateek Arora on 11/19/18.
//  Copyright © 2018 Prateek Arora. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var user:User?
    @IBOutlet weak var firstnameLabel: UITextField!
    
    @IBOutlet weak var lastNameLabel: UITextField!
    
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var phoneLabel: UITextField!
    
    
    @IBOutlet weak var photoView: UIImageView!
    
    var profileImage =  #imageLiteral(resourceName: "defaultCook")
    
    @IBAction func doneButton(_ sender: Any) {
        guard let firstName = firstnameLabel.text, firstName != "" else {
            alert(message: "first Name field is Empty")
            return
        }
        guard let lastName = lastNameLabel.text, lastName != "" else{
            alert(message: "last Name field is Empty")
            return
        }
        guard let phone = Double(phoneLabel.text!) else {
            alert(message: "phone field is invalid")
            return
        }
        if validatePhone(value: phoneLabel.text!) == false{
             alert(message: "Please enter valid phone number")
        }
        guard let email = emailLabel.text, email != "" else{
            alert(message: "email field is Empty")
            return
        }
        
        if isValidEmailAddress(emailAddressString: email) == false {
            alert(message: "Please enter valid email address")
        }
        
        user = User(firstName: firstName, lastName: lastName, email: email, phone: phone)
        
        user?.photo = profileImage
        
        GlobalVariables.userList.append(user!);
    }
    
    func alert(message: String){
        let alertController = UIAlertController(title: "Error", message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func validatePhone(value: String) -> Bool {
        
        if(value.count == 10){
             return true
        } else{
            return false
        }
       
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        firstnameLabel.resignFirstResponder()
        
        print("imageclicked")
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoView.image = selectedImage
        
        profileImage = selectedImage
        print("proflepicturechanged")
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       print("add user segue called")
        let destinationvc = segue.destination as! SelectCuisineViewController
        destinationvc.user = self.user
    }
 

}
