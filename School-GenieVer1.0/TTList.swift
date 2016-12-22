//
//  TTList.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class TTList:Mappable {
    
    
    var TTLst:Array<TimeTableModel>?
    
    required init?(map: Map) {
        
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        
        TTLst <- map["TTLst"]
    }
    
}
