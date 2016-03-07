//
//  SignUpViewController.swift
//  InstaPics
//
//  Created by Zhipeng Mei on 3/6/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rePasswordField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        createButton.layer.cornerRadius = 5
        createButton.enabled = false
        createButton.alpha = 0.5
        
        usernameField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        passwordField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        rePasswordField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
    }
    
    //disable Login Button when username/password fields are empty. Enabled when both are filled
    func textFieldDidChange(textField: UITextField) {
        if (usernameField.text!.isEmpty || passwordField.text!.isEmpty || rePasswordField.text!.isEmpty) {
            createButton.enabled = false
            createButton.alpha = 0.5
        } else {
            createButton.enabled = true
            createButton.alpha = 1.0
        }
    }
    
    @IBAction func backToLogin(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    //    @IBAction func signUp(sender: AnyObject) {
    //
    //        // initialize a user object
    //        let newUser = PFUser()
    //
    //        // set user properties
    //        // newUser.username = userNameField.text
    //        //        newUser.email = emailLabel.text
    //        //   newUser.password = passwordField.text
    //
    //        // call sign up function on the object
    //        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
    //            if let error = error {
    //                print(error.localizedDescription)
    //            } else {
    //                print("User Registered successfully")
    //                // manually segue to logged in view
    //                self.performSegueWithIdentifier("signinSegue", sender: nil)
    //            }
    //        }
    //    }
    


}
