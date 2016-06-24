//
//  LoginViewController.swift
//  Parsetagram
//
//  Created by Juan Luis Herrero Estrada on 6/20/16.
//  Copyright © 2016 Juan Luis Herrero Estrada. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.secureTextEntry = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!){
            (user:PFUser?,error: NSError?) -> Void in
            
            if user != nil{
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        
        /*
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        
        
        
        newUser.signUpInBackgroundWithBlock{ (Sucess: Bool, error: NSError?) -> Void in
            if Sucess{
                print("User Created")
            }else{
                print(error?.localizedDescription)
                if error?.code == 202{
                    print("username already exists")
                  }
                }
              }
       */
           } // end of onSignUp function
        } // end of class


