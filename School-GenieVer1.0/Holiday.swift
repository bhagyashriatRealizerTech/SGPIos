//
//  Holiday.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 27/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
class Holiday{
private var _fromDate:String!
private var _holiday:String!

private var _attachmentExists:Bool!
private var _attachimage:String!
private var _toDate:String!

var cDate : String{
get {
    return _fromDate
    
}
set
{
    _fromDate = newValue
}
}
    var todate:String{
        get {
            return _toDate
            
        }
        set
        {
            _toDate = newValue
        }
    }



var holiday:String
{
    return _holiday
    
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
    init(holiday:String,fromDate:String,attachmentExists:Bool,attachimage:String,toDate:String)
{
    _holiday=holiday
       _attachmentExists=attachmentExists
    _attachimage=attachimage
    _toDate=toDate
    _fromDate=fromDate
    
}
}
