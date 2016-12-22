


//
//  DatapickerHandler.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 09/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//
import Foundation

class SelectChat
{
    private var _chatDate:String!
    private var _username:String!
    private var _msgtext:String!
    private var _attachmentExists:Bool!
    private var _attachimage:String!
    
    var chatDate : String{
        get {
            return _chatDate
            
        }
        set
        {
            _chatDate = newValue
        }
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
    init(username:String,msgtext:String,attachmentExists:Bool,attachimage:String)
    {
        _username=username
        _msgtext=msgtext
        _attachmentExists=attachmentExists
        _attachimage=attachimage
    }
    
    
}
