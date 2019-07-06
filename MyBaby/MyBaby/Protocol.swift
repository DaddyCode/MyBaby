//
//  Protocol.swift
//  MyBaby
//
//  Created by Pawan Kumar on 07/07/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import Foundation


//MARK: - ApiDelegate
public protocol MyBabyApiResponceDelegate {
    func ApiResponceSuccess(Success : NSDictionary)
    func ApiResponceFailure(Failure : NSDictionary)
}


