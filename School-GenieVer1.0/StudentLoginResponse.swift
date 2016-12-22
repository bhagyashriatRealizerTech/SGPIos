//
//  StudentLoginResponse.swift
//  TestApp
//
//  Created by Mac on 05/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper


class StudentLoginResponse: Mappable
{
    
    var AccessToken:String?
    var loginResult:String?
    var sa:SubjectAllocate?
    var studentDtls:StudentDetail?
    var Phs:Array<PublicHoliday>?
    
    required init?(map: Map) {
        
        mapping(map: map)
        
         }
    
    func mapping(map: Map) {
        
        AccessToken <- map["AccessToken"]
        loginResult <- map["loginResult"]
        studentDtls <- map["studentDtls"]
        sa <- map["sa"]
        Phs <- map["Phs"]
    }
    
    
}
