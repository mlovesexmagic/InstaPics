//
//  Login.swift
//  InstaPics
//
//  Created by Zhipeng Mei on 3/8/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit

@IBDesignable class Login: UIView {
    
    var LoginView: UIView!


    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
//    @IBOutlet weak var signupButton: UIButton!
//    
//    @IBAction func signupButton(sender: AnyObject) {
//    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        loginButton.layer.cornerRadius = 4
//        bgGradientsColor()
//        
//        loginButton.enabled = false
//        loginButton.alpha = 0.5
//        usernameField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
//        passwordField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
//    }
    
    //disable Login Button when username/password fields are empty. Enabled when both are filled
//    func textFieldDidChange(textField: UITextField) {
//        if (usernameField.text!.isEmpty || passwordField.text!.isEmpty) {
//            loginButton.enabled = false
//            loginButton.alpha = 0.5
//        } else {
//            loginButton.enabled = true
//            loginButton.alpha = 1.0
//        }
//    }
//    

//    // user log in method
//    @IBAction func onLogin(sender: AnyObject) {
//        
//        let username = usernameField.text ?? ""
//        let password = passwordField.text ?? ""
//        
//        PFUser.logInWithUsernameInBackground(username, password: password) { (user: PFUser?, error: NSError?) -> Void in
//            if let error = error {
//                print("User login failed.")
//                print(error.localizedDescription)
//            } else {
//                print("User logged in successfully")
//                // display view controller that needs to shown after successful login
//                self.performSegueWithIdentifier("loginSegue", sender: nil)
//                
//            }
//        }
//    }
//    
//    

    
    //    @IBAction func onTap(sender: AnyObject) {
    //        view.endEditing(true)
    //    }
    

    // ****** Defaults **********
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "LogIn", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup() {
        LoginView = loadViewFromNib()
        LoginView.frame = bounds
        LoginView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        addSubview(LoginView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        xibSetup()
    }
    
    

}
