//
//  ProfileViewController.swift
//  Parsetagram
//
//  Created by Juan Luis Herrero Estrada on 6/20/16.
//  Copyright © 2016 Juan Luis Herrero Estrada. All rights reserved.
//

import UIKit
import Parse
import ParseUI
class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var feedPosts: [PFObject] = []
    let query = PFQuery(className: "Post")
    let post = PFObject(className: "Post")
    
    
    
    // --------------------------------------------------------------
    
    // this function calls the
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fetchPosts()
    }
    
    // --------------------------------------------------------------

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return feedPosts.count
    }
    
    // --------------------------------------------------------------
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = profileCollectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as! ImageCollectionCell
        let feedPost = feedPosts[indexPath.row]
        if PFUser.currentUser()?.username == feedPost["username"].description{
        let parsedImage = feedPost["media"] as! PFFile
        cell.collectionCellImage.file = parsedImage
        }
        return cell
    }
    
    
    // --------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileNameLabel.text = PFUser.currentUser()?.username
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        profileCollectionView.reloadData()

    }
    
    // --------------------------------------------------------------

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // --------------------------------------------------------------
    
    @IBAction func signOutButton(sender: AnyObject) {
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) in
            self.performSegueWithIdentifier("logoutSegue", sender: nil)
        }
    }
    
    // --------------------------------------------------------------
    
    // fetch posts function
    func fetchPosts() {
        
        query.limit = 20
        query.orderByDescending("CreatedAt")
        post["author"] = PFUser.currentUser()
        query.includeKey("author")
        
        
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            
            if let postsNotNil = posts {
                self.feedPosts = postsNotNil
            } else {
                print(error?.localizedDescription)
            }
            self.profileCollectionView.reloadData()
        }
    } // end of fetch post function
    
    //

}
