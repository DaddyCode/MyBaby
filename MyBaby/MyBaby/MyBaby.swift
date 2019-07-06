//
//  MyBaby.swift
//  MyBaby
//
//  Created by Pawan Kumar on 06/07/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import Foundation
import Alamofire


public class MyBaby {
    private init(){}
    
    
    
    //MARK: - Alert Appear
    public static func AlertAppear(Messaage : String, Title : String, View : UIViewController,Button : Bool,SingleButton : Bool,FirstButtonText : String,SecondButtonText : String){
        
        if Button == false{
            //Simple pop up no button have
            let alert = UIAlertController(title: Title, message: Messaage, preferredStyle: .alert)
            View.present(alert, animated: true, completion: nil)
            let when = DispatchTime.now() + 2.5
            DispatchQueue.main.asyncAfter(deadline: when)
            {
                alert.dismiss(animated: true, completion: nil)
            }
        }
        else if SingleButton == true{
            //inly single button appear here
            let alert = UIAlertController.init(title: Title, message: Messaage, preferredStyle: .alert)
            let Ok = UIAlertAction.init(title: FirstButtonText, style: .default) { (sender) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(Ok)
            View.present(alert, animated: true, completion: nil)
            
        }
        else {
            
            let alert = UIAlertController.init(title: Title, message: Messaage, preferredStyle: .alert)
            let Ok = UIAlertAction.init(title: FirstButtonText, style: .default) { (sender) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(Ok)
            let CANCEL = UIAlertAction.init(title: SecondButtonText, style: .default) { (sender) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(CANCEL)
            View.present(alert, animated: true, completion: nil)
        }
    }
    
    public static func AlertForTextFieldAppear(Message : String,TextField : UITextField){
        TextField.clipsToBounds = false
        TextField.clipsToBounds = false
        let label = UILabel(frame: CGRect(x: 0, y: TextField.layer.frame.height + 2, width: TextField.frame.width, height: 21))
        label.textAlignment = .left
        label.textColor = UIColor.red
        label.text = Message
        label.font = label.font.withSize(14)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        TextField.addSubview(label)
        
        ShakeAnimationForAnyView(viewSend: TextField)
        TextField.textColor = UIColor.red
        TextField.attributedPlaceholder = NSAttributedString(string: TextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            TextField.textColor = UIColor.black
            TextField.attributedPlaceholder = NSAttributedString(string: TextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            label.isHidden = true
        }
        
    }
    
    //MARK: - shakeAnimationForAnyView
    public static func ShakeAnimationForAnyView(viewSend : UIView) {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.08
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: viewSend.center.x - 6, y: viewSend.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: viewSend.center.x + 6, y: viewSend.center.y))
        viewSend.layer.add(animation, forKey: "position")
        
    }
    
    
    
    //MARK: - APiHit
    public static func ApiHitUsingPostMethod( APiUrl: NSString,HeaderParameter : [String: String] , BodyParameter: NSDictionary,ApiName : String,Log : Bool,Controller : UIViewController) {
        
        let Delegate : MyBabyApiResponceDelegate? = Controller as? MyBabyApiResponceDelegate
        let url = APiUrl
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
    
    
    public static func ApiHitUsingGetMethod( APiUrl: NSString,HeaderParameter : [String: String] , BodyParameter: NSDictionary,ApiName : String,Log : Bool,Controller : UIViewController) {
        
        let Delegate : MyBabyApiResponceDelegate? = Controller as? MyBabyApiResponceDelegate
        let url = APiUrl
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

    
    //MARK: - TextfiledAnimation
    func TextFieldPlaceHolderColorChange(textField : UITextField,color : UIColor)  {
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color])
        
    }
    func TextFieldIsValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
}







