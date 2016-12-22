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
    init(LastMsgSender:String,Lastmsgtext:String,LastMsgTime:String,LastmsgSenderimage:String)
    {
        _LastMsgSender=LastMsgSender
        _Lastmsgtext=Lastmsgtext
        _LastMsgTime=LastMsgTime
        _LastmsgSenderimage=LastmsgSenderimage
        
    }
    
    
}
