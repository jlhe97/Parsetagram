//
//  SignUpViewController.swift
//  Parsetagram
//
//  Created by Juan Luis Herrero Estrada on 6/20/16.
//  Copyright © 2016 Juan Luis Herrero Estrada. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var profilePic: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.secureTextEntry = true
        confirmPasswordField.secureTextEntry = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ---------------------------------------------------
    
    
    // user creating function.
    @IBAction func signUpAction(sender: AnyObject) {
        let newUser = PFUser()
        
        newUser.email = emailField.text
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackgroundWithBlock { (Sucess: Bool, error: NSError?) -> Void in
         
            if newUser.password == self.confirmPasswordField.text && Sucess{
                self.performSegueWithIdentifier("login2feedSegue", sender: nil)
            } else {
                print(error?.localizedDescription)
                if (error?.code == 202){
                    print("user already exists")
                    // add code to prevent from going to feed screen.
                } else {
                    print("passwords don't match")
                } // end of inner if-else
            } // end of outer if-else
        } // end of signUpInBackgroundWithBlock
    } // end of function
    
    
} // end of class
