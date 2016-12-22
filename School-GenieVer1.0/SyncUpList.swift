//
//  SyncUpList.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class SyncUpList:Mappable {
    
    var annLst:Array<AnnouncementModel>?
    var attLst:Array<AttendanceModel>?
    
    required init?(map: Map) {
       mapping(map: map)
    }
    
    func mapping(map: Map) {
        
        annLst <- map["annLst"]
        attLst <- map["attLst"]
        
    }
    
    
}
