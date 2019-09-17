//
//  DateAndTime.swift
//  Example
//
//  Created by Matrix Marketers on 17/09/19.
//  Copyright © 2019 pawan. All rights reserved.
//

import UIKit

class DateAndTime: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func getLocalTime(_ sender: Any) {
        let LocalTime = DT.LocalTimeZoneGet()
        print(LocalTime)
    }
    @IBAction func getUcTime(_ sender: Any) {
        let GotDate = NSDate()
        print(GotDate)
    }
    @IBAction func getTimeStamp(_ sender: Any) {
        let TImeStamp = DT.TimeStampGet(InputDate: Date())
        print(TImeStamp)
    }
    @IBAction func timeStampConvertIntoLocalTime(_ sender: Any) {
        let GotDate = DT.TimeStampConvertInToLocalTimeZone(InputTimeStamp: 1568723684.6165419)
        print(GotDate)
    }
    @IBAction func timeStampConvertIntoUcTIme(_ sender: Any) {
        let date = Date(timeIntervalSince1970: 1568723684.6165419)
        print(date)

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
