//
//  CodeHandelerMySqlite.swift
//  MyBaby
//
//  Created by Matrix Marketers on 20/08/19.
//  Copyright © 2019 pawan. All rights reserved.
//

import Foundation
import SQLite



public class CodeHandelerMySqlite{

    var Localdatabase: Connection!

  public func StartSqlite(DataBaseName : String) -> String{
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent(DataBaseName).appendingPathExtension("sqlite3")
            Localdatabase = try Connection(fileUrl.path)
            return "Success"
        } catch {
            print(error)
            return "Failure"
        }
    }
    
   public func CreateTable(ColoumArray : NSArray,TableName : String) -> String{
        
        //Create Table if available already then get Value
        let TableName = TableName
        let usersTableForNow = Table(TableName)
        let createTable = usersTableForNow.create { (table) in
            for key in ColoumArray {
                table.column(Expression<String>(key as! String))
            }
        }
        do {
            try Localdatabase.run(createTable)
            return "Table Create"
        } catch {
            return "Table Already Exist"
        }
        
    }
    
    
   public func AddValueInSqlite(DataWantToSave : NSDictionary, TableName : String){
        
        let TableName : String = TableName
        
        var KeyStringCreate = "("
        var ValueStringCcreate = "("
        for Key in DataWantToSave.allKeys{
            let KeyGot = Key as! String
            KeyStringCreate = KeyStringCreate + KeyGot + ","
            var Value = ""
            
            
            if (DataWantToSave[KeyGot] as? String) != nil {
                //value is a string
                let ValueGot = DataWantToSave[KeyGot] as! String
                Value = "10000" + String(ValueGot)
            }
            else if (DataWantToSave[KeyGot] as? Date) != nil {
                //Value is a Date
                let ValueIsDate = DataWantToSave[KeyGot] as! Date
                ///Date Format Expect
                let formatterFirst = DateFormatter()
                formatterFirst.dateFormat = "EEEE, MMM d, yyyy"
                
                let formatterSecond = DateFormatter()
                formatterSecond.dateFormat = "MM/dd/yyyy"
                
                let formatterThird = DateFormatter()
                formatterThird.dateFormat = "MM-dd-yyyy HH:mm"
                
                let formatterForth = DateFormatter()
                formatterForth.dateFormat = "MMM d, h:mm a"
                
                let formatterFifth = DateFormatter()
                formatterFifth.dateFormat = "MMMM yyyy"
                
                let formatterSix = DateFormatter()
                formatterSix.dateFormat = "MMM d, yyyy"
                
                let formatterSeven = DateFormatter()
                formatterSeven.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
                
                let formatterEight = DateFormatter()
                formatterEight.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                let formatterNine = DateFormatter()
                formatterNine.dateFormat = "dd.MM.yy"
                
                let formatterTen = DateFormatter()
                formatterTen.dateFormat = "HH:mm:ss.SSS"
                
                if formatterFirst.string(from: ValueIsDate) != nil{
                    Value = "20000" + formatterFirst.string(from: ValueIsDate)
                }
                else if formatterSecond.string(from: ValueIsDate) != nil{
                    Value = "20000" + formatterSecond.string(from: ValueIsDate)
                }
                else if formatterThird.string(from: ValueIsDate) != nil{
                    Value = "20000" + formatterThird.string(from: ValueIsDate)
                }
                else if formatterForth.string(from: ValueIsDate) != nil{
                    Value = "20000" + formatterForth.string(from: ValueIsDate)
                }
                else if formatterFifth.string(from: ValueIsDate) != nil{
                    Value = "20000" + formatterFifth.string(from: ValueIsDate)
                }
                else if formatterSix.string(from: ValueIsDate) != nil{
                    Value = "20000" + formatterSix.string(from: ValueIsDate)
                }
                else if formatterSeven.string(from: ValueIsDate) != nil{
                    Value = "20000" + formatterSeven.string(from: ValueIsDate)
                }
                else if formatterEight.string(from: ValueIsDate) != nil{
                    Value = "20000" + formatterEight.string(from: ValueIsDate)
                }
                else if formatterNine.string(from: ValueIsDate) != nil{
                    Value = "20000" + formatterNine.string(from: ValueIsDate)
                }
                else if formatterTen.string(from: ValueIsDate) != nil{
                    Value = "20000" + formatterTen.string(from: ValueIsDate)
                }
                else{
                    Value = "10000Date Format Incorrect"
                }
                
                
            }
            else if (DataWantToSave[KeyGot] as? Int) != nil {
                //Value is a Int
                let ValueGot = DataWantToSave[KeyGot] as! Int
                Value = "30000" + String(ValueGot)
                
            }
            else if (DataWantToSave[KeyGot] as? Double) != nil {
                //Value is a Double
                let ValueGot = DataWantToSave[KeyGot] as! Double
                Value = "40000" + String(ValueGot)
            }
            else if (DataWantToSave[KeyGot] as? Float) != nil {
                //Value is a Float
                let ValueGot = DataWantToSave[KeyGot] as! Float
                Value = "50000" + String(ValueGot)
            }
            else if (DataWantToSave[KeyGot] as? NSNull) != nil {
                //Value is a Int
                Value = "60000"
            }
            else{
                //value is UnKnown
                Value = "10000Value Type is unknown"
            }
            
            ValueStringCcreate = ValueStringCcreate + "'" + Value + "'" + ","
        }
        KeyStringCreate = String(KeyStringCreate.dropLast()) + ")"
        ValueStringCcreate = String(ValueStringCcreate.dropLast()) + ");"
        let FinalQueryForINsert = "INSERT INTO " + TableName + " " + KeyStringCreate + " VALUES " + ValueStringCcreate
        
        do {
            try Localdatabase.run(FinalQueryForINsert)
            print("Value Added in Table")
        } catch {
            //            print(error.localizedDescription)
            self.CreateTable(ColoumArray: DataWantToSave.allKeys as NSArray, TableName: TableName)
            self.AddColoum(Data: DataWantToSave, TableName: TableName)
            
        }
        
    }


    
   public func AddColoum(Data : NSDictionary,TableName : String){
        let TableName = TableName
        let usersTableForNow = Table(TableName)
        let ALLKEYS = Data.allKeys as NSArray
        for key in ALLKEYS {
            let RowinSert = Expression<String?>(key as! String)
            do {
                try Localdatabase.run(usersTableForNow.addColumn(RowinSert))
            } catch {
                print(error)
            }
        }
        //NewRow insert now add data
        self.AddValueInSqlite(DataWantToSave: Data, TableName: TableName)
        
    }
    
    
   public func GetValueFromSqlite( TableName : String) -> NSArray{
        
        let TableNameGot : String = TableName
        var ColoumnArray:[String] = []
        do {
            let s = try Localdatabase!.prepare("PRAGMA table_info(" + TableNameGot + ")" )
            for row in s { ColoumnArray.append(row[1]! as! String) }
        }
        catch { print("some woe in findColumns for \(TableNameGot) \(error)") }
        
        do {
            let usersTableForNow = Table(TableNameGot)
            let users = try Localdatabase.prepare(usersTableForNow)
            
            let TableViewData : NSMutableArray = []
            for user in users {
                
                let MainRowGot : NSMutableDictionary = [:]
                for Coloums in ColoumnArray{
                    let name = Coloums
                    var Value = user[Expression<String?>(name)]
                    
                    
                    if Value == nil{
                        MainRowGot.setValue("", forKey: name)
                    }
                    else if String( Value!).prefix(5) == "10000"{
                        //this is string value
                        Value = String(String( Value!).dropFirst(5))
                        MainRowGot.setValue(Value, forKey: name)
                        
                    }
                    else if String( Value!).prefix(5) == "20000"{
                        //this is Date value
                        Value = String(String( Value!).dropFirst(5))
                        ///Date Format Expect
                        let formatterFirst = DateFormatter()
                        formatterFirst.dateFormat = "EEEE, MMM d, yyyy"
                        
                        let formatterSecond = DateFormatter()
                        formatterSecond.dateFormat = "MM/dd/yyyy"
                        
                        let formatterThird = DateFormatter()
                        formatterThird.dateFormat = "MM-dd-yyyy HH:mm"
                        
                        let formatterForth = DateFormatter()
                        formatterForth.dateFormat = "MMM d, h:mm a"
                        
                        let formatterFifth = DateFormatter()
                        formatterFifth.dateFormat = "MMMM yyyy"
                        
                        let formatterSix = DateFormatter()
                        formatterSix.dateFormat = "MMM d, yyyy"
                        
                        let formatterSeven = DateFormatter()
                        formatterSeven.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
                        
                        let formatterEight = DateFormatter()
                        formatterEight.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                        
                        let formatterNine = DateFormatter()
                        formatterNine.dateFormat = "dd.MM.yy"
                        
                        let formatterTen = DateFormatter()
                        formatterTen.dateFormat = "HH:mm:ss.SSS"
                        
                        if formatterFirst.date(from: String( Value!)) != nil{
                            let DateGot = formatterFirst.date(from: String( Value!))
                            MainRowGot.setValue(DateGot, forKey: name)
                        }
                        else if formatterSecond.date(from: String( Value!)) != nil{
                            let DateGot = formatterSecond.date(from: String( Value!))
                            MainRowGot.setValue(DateGot, forKey: name)
                        }
                        else if formatterThird.date(from: String( Value!)) != nil{
                            let DateGot = formatterThird.date(from: String( Value!))
                            MainRowGot.setValue(DateGot, forKey: name)
                        }
                        else if formatterForth.date(from: String( Value!)) != nil{
                            let DateGot = formatterForth.date(from: String( Value!))
                            MainRowGot.setValue(DateGot, forKey: name)
                        }
                        else if formatterFifth.date(from: String( Value!)) != nil{
                            let DateGot = formatterFifth.date(from: String( Value!))
                            MainRowGot.setValue(DateGot, forKey: name)
                        }
                        else if formatterSix.date(from: String( Value!)) != nil{
                            let DateGot = formatterSix.date(from: String( Value!))
                            MainRowGot.setValue(DateGot, forKey: name)
                        }
                        else if formatterSeven.date(from: String( Value!)) != nil{
                            let DateGot = formatterSeven.date(from: String( Value!))
                            MainRowGot.setValue(DateGot, forKey: name)
                        }
                        else if formatterEight.date(from: String( Value!)) != nil{
                            let DateGot = formatterEight.date(from: String( Value!))
                            MainRowGot.setValue(DateGot, forKey: name)
                        }
                        else if formatterNine.date(from: String( Value!)) != nil{
                            let DateGot = formatterNine.date(from: String( Value!))
                            MainRowGot.setValue(DateGot, forKey: name)
                        }
                        else if formatterTen.date(from: String( Value!)) != nil{
                            let DateGot = formatterTen.date(from: String( Value!))
                            MainRowGot.setValue(DateGot, forKey: name)
                        }
                        else{
                            MainRowGot.setValue(Value, forKey: name)
                        }
                        
                        
                        
                    }
                    else if String( Value!).prefix(5) == "30000"{
                        //this is Int value
                        Value = String(String( Value!).dropFirst(5))
                        
                        MainRowGot.setValue(Int(String( Value!)), forKey: name)
                        
                    }
                    else if String( Value!).prefix(5) == "40000"{
                        //this is Double value
                        Value = String(String( Value!).dropFirst(5))
                        
                        MainRowGot.setValue(Double(String( Value!)), forKey: name)
                        
                    }
                    else if String( Value!).prefix(5) == "50000"{
                        //this is FLoat value
                        Value = String(String( Value!).dropFirst(5))
                        
                        MainRowGot.setValue(Float(String( Value!)), forKey: name)
                        
                    }
                    else if String( Value!).prefix(5) == "60000"{
                        //this is nil value
                        Value = ""
                        MainRowGot.setValue(Value, forKey: name)
                        
                    }
                    else{
                        MainRowGot.setValue(Value, forKey: name)
                        //VAluetype is unkonuw so proceseed with anything
                    }
                    
                }
                TableViewData.add(MainRowGot)
            }
            return TableViewData
            
        } catch {
            print(error)
            return []
        }
        
    }
    
////////////////////////
}