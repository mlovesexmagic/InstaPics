//
//  LoginViewController.swift
//  InstaPics
//
//  Created by Zhipeng Mei on 2/25/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

//    @IBOutlet weak var usernameField: UITextField!
//    @IBOutlet weak var passwordField: UITextField!
//    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    var LoginView: Login!
    var EmailView: Email!


    
    
    //background gradient color variables
    var gradient : CAGradientLayer?
    var toColors : AnyObject?
    var fromColors : AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgGradientsColor()
        
        self.LoginView = Login(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
        //self.signupButton.addTarget(self, action: "myLoginDismissPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(LoginView)
        
    }
    
//    func myLoginDismissPressed(sender: AnyObject) {
//        self.LoginView.removeFromSuperview()
//    }
    
//    //disable Login Button when username/password fields are empty. Enabled when both are filled
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
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//        
//    }
    


    
    
    
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

    
//    @IBAction func onSignUp(sender: AnyObject) {
//        self.EmailView = Email(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
//        self.EmailView.BackToLoginButton.addTarget(self, action: "myDismissPressed:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(EmailView)
//
//    }

//    @IBAction func onTap(sender: AnyObject) {
//        view.endEditing(true)
//    }


     func bgGradientsColor() {

        self.gradient = CAGradientLayer()
        self.gradient?.frame = self.view.bounds
        self.gradient?.colors = [UIColor.cyanColor().CGColor, UIColor.lightGrayColor().CGColor]
        self.view.layer.insertSublayer(self.gradient!, atIndex: 0)
        
        self.toColors = [UIColor.magentaColor().CGColor, UIColor.orangeColor().CGColor]
        //self.toColors = [UIColor.orangeColor().CGColor, UIColor.cyanColor().CGColor]
       //self.toColors = [UIColor.purpleColor().CGColor, UIColor.magentaColor().CGColor]

        //cyanColor(), magentaColor(), redColor(), greenColor(), purpleColor(), orangeColor()

        animateLayer()
        gradient!.startPoint = CGPointZero;
        gradient!.endPoint = CGPointMake(1, 1);
    }
    
    func animateLayer(){
        
        self.fromColors = self.gradient?.colors
        self.gradient!.colors = self.toColors! as? [AnyObject]
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "colors")
        animation.delegate = self
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = 7.00
        animation.removedOnCompletion = true
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.delegate = self
        
        self.gradient?.addAnimation(animation, forKey:"animateGradient")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        self.toColors = self.fromColors;
        self.fromColors = self.gradient?.colors
        
        animateLayer()
    }
    
  
    
 
    

    @IBAction func onSignUpTapped(sender: AnyObject) {
        self.LoginView.removeFromSuperview()
        self.EmailView = Email(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
        self.EmailView.BackToLoginButton.addTarget(self, action: "myEmailDismissPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(EmailView)
    }
    
    /// testing
    func myEmailDismissPressed(sender:UIButton) {
        self.EmailView.removeFromSuperview()
    }
    
    
    
    
    
    
}
