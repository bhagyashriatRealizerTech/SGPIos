//
//  Message.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 19/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation

class Message
{
    private var _MsgTime:String!
    private var _MsgSender:String!
    private var _msgtext:String!
    private var _msgSenderimage:String!
    
    var MsgTime : String{
        get {
            return _MsgTime
            
        }
        set
        {
            _MsgTime = newValue
        }
    }
    
    var MsgSender:String
    {
        return _MsgSender
        
    }
    var msgtext:String
    {
        return _msgtext
        
    }
    var msgSenderimage:String
    {
        return _msgSenderimage
        
    }
    init(MsgSender:String,msgtext:String,MsgTime:String,msgSenderimage:String)
    {
        _MsgSender=MsgSender
        _msgtext=msgtext
        _MsgTime=MsgTime
        _msgSenderimage=msgSenderimage
        
    }
    
}
