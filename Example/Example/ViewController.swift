//
//  ViewController.swift
//  Example
//
//  Created by Matrix Marketers on 18/07/19.
//  Copyright © 2019 pawan. All rights reserved.
//

import UIKit
import MyBaby

class ViewController: UIViewController {

    @IBOutlet weak var txtFieldError: UITextField!
    @IBOutlet weak var txtField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        

        
    }

    @IBAction func btnStringAction(_ sender: Any) {


        self.txtField.text = MyBaby.String.StringEndingWhiteSpaceRemove(InputString: self.txtField.text!)
        self.txtField.text = MyBaby.String.StringStartingWhiteSpaceRemove(InputString: self.txtField.text!)
 
        MyBaby.Alert.AlertForTextFieldAppear(Message: "this si leanth testing error occur", TextField: self.txtFieldError)

    }
    

    
}

