//
//  TextFieldCodeHandler.swift
//  MyBaby
//
//  Created by Pawan Kumar on 07/07/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import Foundation


public class CodeHandlerTextField{
    
    //MARK: - TextfiledAnimation
   public func TextFieldPlaceHolderColorChange(textField : UITextField,color : UIColor)  {
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : color])
        
    }
   public func TextFieldIsValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}
