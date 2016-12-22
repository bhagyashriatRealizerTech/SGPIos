//
//  LoginDetails.swift
//  TestApp
//
//  Created by Mac on 02/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import UIKit
import Alamofire


class LoginDetails
{
    var _firstName:String!
    var _middleName:String!
    var _lastName:String!
    
    
    var firstName: String{
        if _firstName == nil{
            _firstName = ""
        }
        
        return _firstName
    }
    
    var fmiddleName: String{
        if _middleName == nil{
            _middleName = ""
        }
        
        return _middleName
    }
    
    
    var lastName: String{
        if _lastName == nil{
            _lastName = ""
        }
        
        return _lastName
    }
    
    
       
    
    
    
}
