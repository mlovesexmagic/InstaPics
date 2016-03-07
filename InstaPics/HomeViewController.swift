//
//  HomeViewController.swift
//  InstaPics
//
//  Created by Zhipeng Mei on 3/3/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit
import Parse

let userDidLogoutNotification = "userDidLogoutNotification"

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var mediaArr: [PFObject]?
    var refreshControl:UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.estimatedRowHeight = 220.0
        //tableView.rowHeight = 520;

        //tableView.rowHeight = UITableViewAutomaticDimension
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("_created_at")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if media != nil {
                self.mediaArr = media
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mediaArr != nil {
            return mediaArr!.count
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("instaCellTableViewCell", forIndexPath: indexPath) as! instaCellTableViewCell
        let media = mediaArr![indexPath.row]
        cell.imageLabel.text = media["caption"] as? String
        let userImageFile = media["media"] as! PFFile
        userImageFile.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    let image = UIImage(data:imageData)
                    cell.profileImageView.image = image
                }
            }
        }
        return cell
    }
    
    func refresh(sender: AnyObject) {
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("_created_at")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if media != nil {
                self.mediaArr = media
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
        self.refreshControl.endRefreshing()
    }
    
    @IBAction func logOutClicked(sender: AnyObject) {
        
        // PFUser.currentUser() will now be nil
        print("User logged out successfully")
        PFUser.logOut()
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
        
//        let vController = self.storyboard!.instantiateViewControllerWithIdentifier("loginView") as UIViewController
//        self.presentViewController(vController, animated: true, completion: nil)

   //     -----------------------------------------------------------------
//        PFUser.logOutInBackgroundWithBlock { (error: NSError?) -> Void in
//            if error == nil {
//                //currentUser?.logout()
//                // print("Notification sent")
//                NSNotificationCenter.defaultCenter().postNotificationName(self.userDidLogoutNotification, object: nil);
//                print("User logged out")
//                let vController = self.storyboard!.instantiateViewControllerWithIdentifier("loginView") as UIViewController
//                self.presentViewController(vController, animated: true, completion: nil)
//                //self.dismissViewControllerAnimated(false, completion: nil)
//                //self.performSegueWithIdentifier("logOutSegueID", sender: nil)
//            }
//            else {
//                print("Error while logging out")
//            }
//        }
        
    }


}
