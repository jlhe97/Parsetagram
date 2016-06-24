//
//  PostDataViewController.swift
//  Parsetagram
//
//  Created by Juan Luis Herrero Estrada on 6/23/16.
//  Copyright © 2016 Juan Luis Herrero Estrada. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostDataViewController: UIViewController {
   
    // --------------------------------------------------------------
    
    @IBOutlet weak var detailImageView: PFImageView!
    @IBOutlet weak var detailCaptionLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
  
    var post: PFObject?
    
    // --------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // block of code for formatting the date style on the post
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.timeStyle = .ShortStyle
        let dateString = formatter.stringFromDate((post?.createdAt)!)
      
        
        timestampLabel.text = dateString
        detailImageView.file = post!["media"] as? PFFile
        detailCaptionLabel.text = post!["caption"].description
        usernameLabel.text = post!["username"].description
        detailImageView.loadInBackground()
        
        
    }
    
    // --------------------------------------------------------------

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // --------------------------------------------------------------

}
