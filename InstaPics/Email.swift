//
//  Email.swift
//  InstaPics
//
//  Created by Zhipeng Mei on 3/8/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit

@IBDesignable class Email: UIView {

     var view: UIView!
    
    @IBOutlet weak var BackToLoginButton: UIButton!
    

    @IBAction func dismissPressed(sender: AnyObject) {
        
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "Email", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        addSubview(view)
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
