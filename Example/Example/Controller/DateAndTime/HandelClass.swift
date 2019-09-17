//
//  HandelClass.swift
//  Example
//
//  Created by Matrix Marketers on 17/09/19.
//  Copyright © 2019 pawan. All rights reserved.
//

import Foundation

let DT = Handel()
class Handel: NSObject {
    
    func LocalTimeZoneGet() -> String{
        let dtf = DateFormatter()
        dtf.timeZone = TimeZone.current
        dtf.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dtf.string(from: Date())
    }
    
    func TimeStampGet(InputDate : Date) -> Double{
        let currentTimeStamp  =  InputDate.timeIntervalSince1970
        return currentTimeStamp
    }
    
    func TimeStampConvertInToLocalTimeZone(InputTimeStamp : Double) -> String{
        
        let date = Date(timeIntervalSince1970: Double(InputTimeStamp))
        let dateFormatt = DateFormatter();
        dateFormatt.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        dateFormatt.timeZone = NSTimeZone.local
        let CurrentTimeFromTimeStamp = dateFormatt.string(from: date as Date)
        return CurrentTimeFromTimeStamp
    }
}
