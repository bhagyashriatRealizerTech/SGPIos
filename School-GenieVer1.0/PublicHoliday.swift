//
//  PublicHoliday.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class PublicHoliday:Mappable{
    
    var CreatedBy:String?
    var Holiday:String?
    var PHEndDate:String?
    var PHStartDate:String?
    
    required init?(map: Map) {
        
        CreatedBy = map["CreatedBy"].value()
        Holiday = map["Holiday"].value()
        PHEndDate = map["PHEndDate"].value()
        PHStartDate = map["PHStartDate"].value()
        
        
    }
    
    func mapping(map: Map) {
        
    }
    
    
    
}
