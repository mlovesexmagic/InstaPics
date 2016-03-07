//
//  EmailViewController.swift
//  InstaPics
//
//  Created by Zhipeng Mei on 3/6/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var backToLogin: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backToLogin.layer.cornerRadius = 5
        nextButton.layer.cornerRadius = 5
        
        nextButton.enabled = false
        nextButton.alpha = 0.5
        emailTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //disable Login Button when username/password fields are empty. Enabled when both are filled
    func textFieldDidChange(textField: UITextField) {
        if (emailTextField.text!.isEmpty) {
            nextButton.enabled = false
            nextButton.alpha = 0.5
        } else {
            nextButton.enabled = true
            nextButton.alpha = 1.0
        }
    }
    
    @IBAction func backToLogin(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    //show sign up sub view
    @IBAction func onNext(sender: AnyObject) {
        self.performSegueWithIdentifier("emailToSignup", sender: nil)
    }
    


}
