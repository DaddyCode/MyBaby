//
//  LocalDatabaseViewController.swift
//  Example
//
//  Created by Pawan Kumar on 25/08/19.
//  Copyright © 2019 pawan. All rights reserved.
//

import UIKit
import MyBaby

class LocalDatabaseViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMessage: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Btnback
    @IBAction func btnSaveValue(_ sender: Any) {
        
        if txtName.text == ""{
            MyBaby.Alert.AlertAppear(Messaage: "Please enter name", Title: "", View: self, Button: false, SingleButton: false, FirstButtonText: "", SecondButtonText: "")

        }
        else if txtMessage.text == ""{
            MyBaby.Alert.AlertAppear(Messaage: "Please enter message", Title: "", View: self, Button: false, SingleButton: false, FirstButtonText: "", SecondButtonText: "")

        }
        else{
        
     let tempDict = ["Name" : self.txtMessage.text!,"Message" : self.txtMessage.text!] as NSDictionary
     let Status = MyBaby.MySqualDatabase.SaveValueInSqlite(DataBaseName: "NothingToWorry", TableName: "MyBaby", DataWantToSave: tempDict)
        
     MyBaby.Alert.AlertAppear(Messaage: Status, Title: "", View: self, Button: false, SingleButton: false, FirstButtonText: "", SecondButtonText: "")
        self.txtMessage.text = ""
        self.txtName.text = ""
        }
    }
    @IBAction func GetValuefromDatabase(_ sender: Any) {
      let Data = MyBaby.MySqualDatabase.GetValueFromSqlite(TableName: "MyBaby", DataBaseName: "NothingToWorry")
        print(Data)
        
        MyBaby.Alert.AlertAppear(Messaage: "Data Fetch", Title: "", View: self, Button: false, SingleButton: false, FirstButtonText: "", SecondButtonText: "")

        
    }
    
    @IBAction func deletetableFromSqlite(_ sender: Any) {
        
        let Status = MyBaby.MySqualDatabase.DeleteTableInSqlite(DataBaseName: "NothingToWorry", TableName: "MyBaby")
        
        MyBaby.Alert.AlertAppear(Messaage: Status, Title: "", View: self, Button: false, SingleButton: false, FirstButtonText: "", SecondButtonText: "")

    }
    
    
    @IBAction func BtnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
