//
//  Protocol.swift
//  MyBaby
//
//  Created by Pawan Kumar on 07/07/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import Foundation
import Alamofire


//MARK: - ApiDelegate
public protocol ApiResponceDelegateMB {
    func ApiResponceSuccess(Success : NSDictionary)
    func ApiResponceFailure(Failure : NSDictionary)
}

//MARK: - ApiCode
public class CodeHandlerApi{

    
//    //MARK: - APiHit
    public func ApiHitUsingPostMethod( APiUrl: NSString,HeaderParameter : [String: String] , BodyParameter: NSDictionary,ApiName : String,Log : Bool,Controller : UIViewController) {

        let Delegate : ApiResponceDelegateMB? = Controller as? ApiResponceDelegateMB
        var url = APiUrl
        url = url.replacingOccurrences(of: " ", with: "%20") as NSString
        URLCache.shared.removeAllCachedResponses()

        //Create a non-caching configuration.
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.urlCache = nil

        
        Alamofire.request(url as String , method: .post, parameters: BodyParameter as? Parameters,headers:HeaderParameter).responseJSON { response in

            if Log == true{
                print("API NAME :-  \(ApiName)")
                print("API URL :-  \(APiUrl)")
                print("API HeaderParameter :-  \(HeaderParameter)")
                print("API BodyParameter :-  \(BodyParameter)")
                print("API Result :-  \(response)")
            }
            
            let InternetCheck = NetworkReachabilityManager()!.isReachable
            if InternetCheck == false{
                let JSON = ["message":"Please check internet connection.","ApiName":ApiName,"status":"001"]
                Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
            }
            else{
                
                let statusCode = (response.response?.statusCode)! //example : 200
                
                if statusCode == 200{
                    if let JSON = response.result.value {
                        let sessionExpireJson = JSON as! NSDictionary
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceSuccess(Success: GetAllApiData)
                    }
                    else{
                        let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"002"]
                        Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                    }
                }
                else{
                    if let JSON = response.result.value {
                        let sessionExpireJson = JSON as! NSDictionary
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceSuccess(Success: GetAllApiData)
                    }
                    else{
                        let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"002"]
                        Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                    }
                }
                
         
          }
        }
    }
    
    
    
    public func ApiHitUsingGetMethod( APiUrl: NSString,HeaderParameter : [String: String] , BodyParameter: NSDictionary,ApiName : String,Log : Bool,Controller : UIViewController) {

        let Delegate : ApiResponceDelegateMB? = Controller as? ApiResponceDelegateMB
        var url = APiUrl
        url = url.replacingOccurrences(of: " ", with: "%20") as NSString
        URLCache.shared.removeAllCachedResponses()

        //Create a non-caching configuration.
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.urlCache = nil

        Alamofire.request(url as String , method: .post, parameters: BodyParameter as? Parameters,headers:HeaderParameter).responseJSON { response in

            if Log == true{
                print("API NAME :-  \(ApiName)")
                print("API URL :-  \(APiUrl)")
                print("API HeaderParameter :-  \(HeaderParameter)")
                print("API BodyParameter :-  \(BodyParameter)")
                print("API Result :-  \(response)")
            }

            let InternetCheck = NetworkReachabilityManager()!.isReachable
            if InternetCheck == false{
                let JSON = ["message":"Please check internet connection.","ApiName":ApiName,"status":"001"]
                Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
            }
            else{
                
                let statusCode = (response.response?.statusCode)! //example : 200
                
                if statusCode == 200{
                    if let JSON = response.result.value {
                        let sessionExpireJson = JSON as! NSDictionary
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceSuccess(Success: GetAllApiData)
                    }
                    else{
                        let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"002"]
                        Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                    }
                }
                else{
                    if let JSON = response.result.value {
                        let sessionExpireJson = JSON as! NSDictionary
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceSuccess(Success: GetAllApiData)
                    }
                    else{
                        let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"002"]
                        Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                    }
                }
                
          }
        }
    }
    
}
