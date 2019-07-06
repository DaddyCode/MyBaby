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
public protocol MyBabyApiResponceDelegate {
    func ApiResponceSuccess(Success : NSDictionary)
    func ApiResponceFailure(Failure : NSDictionary)
}

//MARK: - ApiCall
public extension UIViewController{

    //MARK: - APiHit
    public static func ApiHitUsingPostMethod( APiUrl: NSString,HeaderParameter : [String: String] , BodyParameter: NSDictionary,ApiName : String,Log : Bool) {

        //   print(dict)
        let Delegate : MyBabyApiResponceDelegate? = self as? MyBabyApiResponceDelegate
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

            if let JSON = response.result.value {
                let sessionExpireJson = JSON as! NSDictionary
                if(sessionExpireJson.allKeys.count == 1){
                    //That's mean api result is not proper
                    let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName]
                    Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
                }
                else{
                    if sessionExpireJson["status"] as! String == "0"{
                        //Api Failure
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceFailure(Failure: GetAllApiData)
                    }
                    else{
                        let GetAllApiData : NSMutableDictionary = NSMutableDictionary.init(dictionary: sessionExpireJson)
                        GetAllApiData.setValue(ApiName, forKey: "ApiName")
                        Delegate?.ApiResponceSuccess(Success: GetAllApiData)
                    }

                }
            }
            else{
                let JSON = ["message":"Due to some reason error occur please try again","ApiName":ApiName,"status":"001"]
                Delegate?.ApiResponceFailure(Failure: JSON as NSDictionary)
            }
        }
    }
}
