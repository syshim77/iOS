//
//  ViewController.swift
//  LogIn
//
//  Created by Shim Sooyeon on 2017. 11. 15..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var IDTextField: UITextField!
    @IBOutlet var PWTextField: UITextField!
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func SignInButton(_ sender: UIButton) {
        print("Touch up inside - sign in")
        
        if let id = IDTextField.text, let pw = PWTextField.text {
            print("ID: \(id), PW: \(pw)")
        } else {
            print("Please resign")
        }
    }
    @IBAction func SignUpButton(_ sender: UIButton) {
        print("Touch up inside - sign up")
        
        IDTextField.text = nil
        PWTextField.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

