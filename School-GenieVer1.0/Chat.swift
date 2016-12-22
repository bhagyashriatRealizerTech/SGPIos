//
//  Chat.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 17/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation

class Chat
{
    private var _cDate:String!
    private var _username:String!
    private var _msgtext:String!
    private var _attachmentExists:Bool!
    private var _attachimage:String!
    private var _currenttime:String!
    
    var cDate : String{
        get {
            return _cDate
            
        }
        set
        {
            _cDate = newValue
        }
    }
    
    
    
    var currenttime:String{
        return _currenttime
    }
    var username:String
    {
        return _username
        
    }
    var msgtext:String
    {
        return _msgtext
        
    }
    var attachmentExists:Bool
    {
        return _attachmentExists
        
    }
    var attachimage:String{
        get{
            return _attachimage
        }
        set{
            _attachimage=newValue
        }
    }
    init(username:String,msgtext:String,attachmentExists:Bool,attachimage:String,currenttime:String)
    {
        _username=username
        _msgtext=msgtext
        _attachmentExists=attachmentExists
        _attachimage=attachimage
        _currenttime=currenttime
    
    }
    
    
}
