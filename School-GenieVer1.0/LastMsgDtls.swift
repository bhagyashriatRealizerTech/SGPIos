//
//  LastMsgDtls.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 19/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
class LastMsgDtls
{
    private var _LastMsgTime:String!
    private var _LastMsgSender:String!
    private var _Lastmsgtext:String!
    private var _LastmsgSenderimage:String!
    private var _LastmessageSenderId:String!
    private var _ThreadName:String!
    private var _ThreadId:String!
    
    init() {
        
    }
    
    var ThreadId : String{
        get {
            return _ThreadId
            
        }
        set
        {
            _ThreadId = newValue
        }
    }
    
    var ThreadName : String{
        get {
            return _ThreadName
            
        }
        set
        {
            _ThreadName = newValue
        }
    }

    var LastmessageSenderId : String{
        get {
            return _LastmessageSenderId
            
        }
        set
        {
            _LastmessageSenderId = newValue
        }
    }

    
    var LastMsgTime : String{
        get {
            return _LastMsgTime
            
        }
        set
        {
            _LastMsgTime = newValue
        }
    }
    
    var LastMsgSender:String
    {
        return _LastMsgSender
        
    }
    var Lastmsgtext:String
    {
        return _Lastmsgtext
        
    }
    var LastmsgSenderimage:String
    {
        return _LastmsgSenderimage
        
    }
    init(LastMsgSender:String,Lastmsgtext:String,LastMsgTime:String,LastmsgSenderimage:String,LastMessageSenderID:String,ThraedID:String,ThreadName:String)
    {
        _LastMsgSender=LastMsgSender
        _Lastmsgtext=Lastmsgtext
        _LastMsgTime=LastMsgTime
        _LastmsgSenderimage=LastmsgSenderimage
        _LastmessageSenderId = LastMessageSenderID
        _ThreadId = ThraedID
        _ThreadName = ThreadName
        
    }
    
    
}
