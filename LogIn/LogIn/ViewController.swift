//
//  ViewController.swift
//  LogIn
//
//  Created by Shim Sooyeon on 2017. 8. 3..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var photoImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        IDTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func signIn(_ sender: UIButton) {
        let userID: String? = IDTextField.text
        let userPW: String? = passwordTextField.text
        
        //if let
        
        print("touch up inside - sign in")
        print("ID: \(userID!), PW: \(userPW!)")
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        print("touch up inside - sign up")
    }


}

