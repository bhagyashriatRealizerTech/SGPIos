//
//  FunCenterEventModel.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class FunCenterEventModel:Mappable {
    
    var CreateTS:String?
    var Event:String?
    var EventDate:String?
    var EventId:String?
    var ThumbNailImage:String?
    var ThumbNailPath:String?
    
    required init?(map: Map) {
        
        
        CreateTS = map["CreateTS"].value()
        Event = map["Event"].value()
        EventDate = map["EventDate"].value()
        EventId = map["EventId"].value()
        ThumbNailImage = map["ThumbNailImage"].value()
        ThumbNailPath = map["ThumbNailPath"].value()
        
    }
    
    func mapping(map: Map) {
        
    }
    init() {
        
    }

    
    func setEvents(createTs:String, event:String, eventdate:String, eventId:String, thumbnailImage:String, thumbnailPath:String){
        CreateTS = createTs
        Event = event
        EventDate = eventdate
        EventId = eventId
        ThumbNailPath = thumbnailPath
        ThumbNailImage = thumbnailImage
    }
    
}
