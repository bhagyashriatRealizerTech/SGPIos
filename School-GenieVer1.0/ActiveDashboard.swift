//
//  ActiveDashboard.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 05/01/17.
//  Copyright © 2017 Realizer. All rights reserved.
//

import Foundation

class ActiveDashboard{
    
    private var _date:String!
    private var _message:String!
    private var _title:String!
    private var _messageId:String!

      
    var Date : String{
        get {
            return _date
            
        }
        set
        {
            _date = Date
        }
    }
    
    var MessageID : String{
        get {
            return _messageId
            
        }
        set
        {
            _messageId = MessageID
        }
    }
    
    var Message : String{
        get {
            return _message
            
        }
        set
        {
            _message = Message
        }
    }
    
    var Title : String{
        get {
            return _title
            
        }
        set
        {
            _title = Title
        }
    }
    
    init(date:String, msg:String, title:String , messageID:String) {
        
        _date = date
        _message = msg
        _title = title
        _messageId = messageID
    }
}
