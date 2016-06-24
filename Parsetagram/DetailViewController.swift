//
//  DetailViewController.swift
//  Parsetagram
//
//  Created by Juan Luis Herrero Estrada on 6/20/16.
//  Copyright © 2016 Juan Luis Herrero Estrada. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import AFNetworking

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate{

    // ----------------------------------------------------------------------------------
    @IBOutlet weak var feedTable: UITableView!
    var feedPosts: [PFObject] = []
    var imagePost: UIImage?
    let query = PFQuery(className: "Post")
    let post = PFObject(className: "Post")
    var isMoreDataLoading = false
    var refreshControl = UIRefreshControl()
    var skipMultiplier = 0
    // ----------------------------------------------------------------------------------
    
    // function for infinite scrolling
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if (!isMoreDataLoading){
            
            isMoreDataLoading = true
            let scrollViewContentHeight = feedTable.contentSize.height
            let scrollOffsetThreshold = scrollViewContentHeight - feedTable.bounds.size.height
            
            if(scrollView.contentOffset.y > scrollOffsetThreshold && feedTable.dragging) {
                isMoreDataLoading = true
                fetchPosts()
            }
        }
    }
    
    // ----------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedTable.delegate = self
        feedTable.dataSource = self
        
        
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
        feedTable.insertSubview(refreshControl, atIndex: 0)
    }
    
    // ----------------------------------------------------------------------------------
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fetchPosts()
        //self.feedTable.reloadData()
    }
    
    // ----------------------------------------------------------------------------------
    
    // function to reload the data by dragging it.
    func refreshControlAction(refreshControl: UIRefreshControl){
        fetchPosts()
        //self.feedTable.reloadData()
        //refreshControl.endRefreshing()
    }
    
    // ----------------------------------------------------------------------------------

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ----------------------------------------------------------------------------------
    
    // this function determines the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return feedPosts.count
    }
    
    // ----------------------------------------------------------------------------------
    
    // obtains the content of the cell and displays it. 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! PostCell
        
       
                let feedPost = feedPosts[indexPath.row]
                let parsedImage = feedPost["media"] as! PFFile
                let parsedCaption = feedPost["caption"]
                let username  =  feedPost["username"].description
                cell.postImage.file = parsedImage
                cell.captionLabel.text = parsedCaption.description
                cell.postImage.loadInBackground()
                cell.usernameLabel.text = username
                
                return cell

    }
    
    // ----------------------------------------------------------------------------------
    
    // this function is to fetch posts
    func fetchPosts() {
        
        query.limit = 20
        query.orderByDescending("CreatedAt")
        post["author"] = PFUser.currentUser()
        query.includeKey("author")
        query.skip = query.limit * skipMultiplier
        
        
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let postsNotNil = posts {
                self.feedPosts.appendContentsOf(postsNotNil)
                self.skipMultiplier += 1
            } else {
                print(error?.localizedDescription)
            }
            self.feedTable.reloadData()
            self.refreshControl.endRefreshing()
        
        }
    } // end of fetch post function
    
    // ----------------------------------------------------------------------------------
    
    // this function sends information over to the view controller that shows the details of the image.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController = segue.destinationViewController as! PostDataViewController
        let cell = sender as! PostCell
        let indexPath = feedTable.indexPathForCell(cell)
        let post = feedPosts[indexPath!.row]
        viewController.post = post
    }
} // end of class
