//
//  CaptureViewController.swift
//  InstaPics
//
//  Created by Zhipeng Mei on 3/3/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit
import Parse

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    var editedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = profileImageView
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Step 1: Picking a Picture from the Camera Roll
    func imageTapped(img: AnyObject)
    {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    //Step 2: Implement the delegate
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            
            profileImageView.image = editedImage
            dismissViewControllerAnimated(true, completion: { () -> Void in
            })
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //self.performSegueWithIdentifier("selectToUpload", sender: nil)
        let passThisImage = editedImage
        let detailViewController = segue.destinationViewController as! ProcessingViewController
        detailViewController.readyImage = passThisImage!

    }
}
