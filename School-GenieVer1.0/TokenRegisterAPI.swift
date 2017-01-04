//
//  TokenRegisterAPI.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 03/01/17.
//  Copyright © 2017 Realizer. All rights reserved.
//

import Foundation

import Alamofire
import AlamofireImage
import ObjectMapper
import CoreData

class TokenRegisterAPI{
    
    
    func registerToken(completed: DownloadComplete){
        
        let methodName = "RegisterStudentDeviceforFcm"
        
        
        let tokenmethod = FCMTokenMethods()
        let token:String = tokenmethod.getToken()
        let userid:String = UserDefaults.standard.value(forKey: "UserId") as! String
        let deviceId:String = UserDefaults.standard.value(forKey: "DeviceId") as! String
        
        Current_Url = "\(BASE_URL)\(methodName)"
        print(Current_Url)

          let current_url = URL(string: Current_Url)!
          print(current_url)
        
        let headers:HTTPHeaders = ["Content-Type": "application/json",
                                    "Accept": "application/json"]
        
        let parameters = ["regCode":token,"UserId":userid,"deviceId":deviceId]
        
        

        
        Alamofire.request(current_url, method: .post, parameters:parameters, encoding: JSONEncoding.default, headers: headers).responseString{ response in
            
            let result = response.result
            
            print(result.value)
            
            
        }
        
        completed()
    }
    
    
}

