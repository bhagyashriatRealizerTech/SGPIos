//
//  ConversationModel.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class ConversationModel:Mappable {
    
    var ConversationId:String?
    var fromTeacher:Bool?
    var SchoolCode:String?
    var from:String?
    var to:String?
    var text:String?
    var sentTime:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
    
}
