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

    @IBOutlet weak var txtField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        

        
    }

    @IBAction func btnStringAction(_ sender: Any) {
        

        self.txtField.text = MyBaby.String.StringMultipleLineWhiteSpaceRemove(InputString: self.txtField.text!)
        print(MyBaby.String.StringHaveCharacter(InputString: self.txtField.text!))
        
    }
    

    
}

