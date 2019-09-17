//
//  ViewController.swift
//  Example
//
//  Created by Matrix Marketers on 18/07/19.
//  Copyright © 2019 pawan. All rights reserved.
//

import UIKit
import MyBaby

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableViewMain: UITableView!
    
    let ExampleList = ["Call Api","Local DataBase","String Handel","TextField Handel","Date & Time Handel","Show Alert","Animation","Loader","Location"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableViewMain.register(UINib.init(nibName: "ViewControllerTableViewCell", bundle: nil), forCellReuseIdentifier: "ViewControllerTableViewCell")
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
        
    }

    //MARk: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExampleList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.tableViewMain.dequeueReusableCell(withIdentifier: "ViewControllerTableViewCell", for: indexPath) as! ViewControllerTableViewCell

        cell.lblName.text = ExampleList[indexPath.row]
        self.tableViewMain.tableFooterView = UIView()

        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            // wait create api
        }
        else if indexPath.row == 1{
            // start local database
            let InstanceCreate = self.storyboard?.instantiateViewController(withIdentifier: "LocalDatabaseViewController") as! LocalDatabaseViewController
            self.present(InstanceCreate, animated: true, completion: nil)
        }
        else if indexPath.row == 4{
            let InstanceCreate = self.storyboard?.instantiateViewController(withIdentifier: "DateAndTime") as! DateAndTime
            self.present(InstanceCreate, animated: true, completion: nil)
        }
        
    }

    
}

