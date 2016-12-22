//
//  Alerts.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 26/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
class Alerts

{
    private var _AlDate:String!
     private var _aldate:String!
    private var _category:String!
    private var _msgText:String!
    private var _attachmentExists:Bool!
    private var _attachimage:String!
    private var _initial:String!
    
    var AlDate : String{
        get {
            return _AlDate
            
        }
        set
        {
            _AlDate = newValue
        }
    }
    
    var aldate:String{
        return _aldate
    }
    
    var category:String
    {
        return _category
        
    }
    var msgText:String
    {
        return _msgText
        
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
    var initial:String{
        return _initial
    }
    init(category:String,msgText:String,attachmentExists:Bool,attachimage:String,aldate:String,initial:String)
    {
        _category=category
        _msgText=msgText
        _attachmentExists=attachmentExists
        _attachimage=attachimage
        _aldate=aldate
        _initial=initial
    }
    
    
}
