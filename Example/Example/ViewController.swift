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

        MyBaby.MySqual.StartSqlite(DataBaseName: "PAWANDATABASE")
        let TEmpDIct = ["First" : "Value","Second" : "nothing to say"] as! NSDictionary
        MyBaby.MySqual.AddValueInSqlite(DataWantToSave: TEmpDIct, TableName: "FirstTable")
        

     let Data =  MyBaby.MySqual.GetValueFromSqlite(TableName: "FirstTable")
     print(Data)

    }
    

    
}

