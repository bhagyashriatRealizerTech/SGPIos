//
//  FunCenterImageList.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class FunCenterImageList:Mappable {
    
    var Images:Array<FunCenterImageModel>?
    
    required init?(map: Map) {
        
       mapping(map: map)
    }
    
    func mapping(map: Map) {
        
        Images <- map["Images"]
    }
    
}
