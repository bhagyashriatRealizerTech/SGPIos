//
//  RecoverPasswordByEmailAPI.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import ObjectMapper

class RecoverPasswordByEmailAPI{
    
    func downloadFunCenterImage(completed: DownloadComplete){
        
        let methodName = "fetchDateSchoolEventImages"
        Current_Url = "\(BASE_URL)\(methodName)"
        print(Current_Url)
        
        let current_url = URL(string: Current_Url)!
        
        
        
        let accesstoken:String = UserDefaults.standard.value(forKey: "Accesstoken") as! String
        let schoolcode:String = UserDefaults.standard.value(forKey: "SchoolCode") as! String
        let std:String = UserDefaults.standard.value(forKey: "Std") as! String
        let div:String = UserDefaults.standard.value(forKey: "Div") as! String
        let academicyear:String = UserDefaults.standard.value(forKey: "AcademicYear") as! String
        
        let parameters1 = ["schoolCode" :schoolcode,"AcademicYear" :academicyear,
                           "Std" :std,"Div":div,"syncDate" :"12/15/2016"]
        
        let headers1:HTTPHeaders = ["AccessToken":accesstoken,
                                    "Content-Type": "application/json",
                                    "Accept": "application/json"]
        
        print(current_url)
        
        Alamofire.request(current_url, method: .post, parameters: parameters1, encoding: JSONEncoding.default, headers: headers1).responseJSON{ response in
            
            
            let result = response.result
            
            print(result.value)
            
            
        }
        
        completed()
    }
    

    
}
