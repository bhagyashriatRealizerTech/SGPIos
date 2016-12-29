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
    var profileUrl:String?
    var senderName:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
    
    init() {
        
    }
    
    func setMessage(chatId:String, fromteacher:Bool, schoolCode:String, fromId:String,toId:String,message:String,msgTime:String,profilePic:String,senderN:String){

        ConversationId = chatId
        fromTeacher = fromteacher
        SchoolCode = schoolCode
        from = fromId
        to = toId
        text = message
        sentTime = msgTime
        profileUrl = profilePic
        senderName = senderN
    }
    
}
