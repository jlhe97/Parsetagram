//
//  PostViewController.swift
//  Parsetagram
//
//  Created by Juan Luis Herrero Estrada on 6/20/16.
//  Copyright © 2016 Juan Luis Herrero Estrada. All rights reserved.
//

import UIKit
import Parse
import PhotosUI
class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var captionField: UITextField!
    @IBOutlet weak var previewPic: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    let imagePicker = UIImagePickerController()
    var feedPosts: [PFObject]?
    
    // -----------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // -----------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // -----------------------------------------------------
    
    // choose image function
    @IBAction func selectImageButton(sender: AnyObject) {
        
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    // -------------------------------------------------------
    
    // put image in the preview
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            previewPic.contentMode = .ScaleAspectFit
            previewPic.image = originalImage
        }
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    // -------------------------------------------------------
    // confir
    @IBAction func confirmUpload(sender: AnyObject) {
        activityIndicator.startAnimating()
        Post.postUserImage(previewPic.image, withCaption: captionField.text) { (success: Bool, error: NSError?) in
            if success {
                print("sucess")
                self.tabBarController?.selectedIndex = 0
            } else {
                print(error?.localizedDescription)
            }
            self.activityIndicator.stopAnimating()
        }
    }
    // -----------------------------------------------------
    
} // end of class
