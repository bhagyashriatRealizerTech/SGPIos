//
//  SendMessageAPI.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 22/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation

import Alamofire
import AlamofireImage
import ObjectMapper
import CoreData

class SendMessageAPI{
    
    
    func sendMesssage(completed: DownloadComplete,msgObj:ConversationModel){
        
            let methodName = "AddConversation"
            Current_Url = "\(BASE_URL)\(methodName)"
            print(Current_Url)
            
            let current_url = URL(string: Current_Url)!
        
            let accesstoken:String = UserDefaults.standard.value(forKey: "Accesstoken") as! String
            let schoolcode:String = UserDefaults.standard.value(forKey: "SchoolCode") as! String
        
            let parameters1 = ["SchoolCode":schoolcode,"ConversationId":msgObj.ConversationId,"fromTeacher":msgObj.fromTeacher,"from":msgObj.from,
                "to":msgObj.to,"text":msgObj.text,"sentTime":msgObj.sentTime]
            
            let headers1:HTTPHeaders = ["AccessToken":accesstoken,
                                        "Content-Type": "application/json",
                                        "Accept": "application/json"]
            
            print(current_url)
            
            Alamofire.request(current_url, method: .post, parameters: parameters1, encoding: JSONEncoding.default, headers: headers1).responseString{ response in
                
                let result = response.result
                
                print(result.value)
                
               
            }
            
            completed()
        }
        
        
}
