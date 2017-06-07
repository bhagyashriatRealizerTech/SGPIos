//
//  DatapickerHandler.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 09/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
class ClassWork
{
    private var _cwDate:String!
    private var _subject:String!
    private var _subjectText:String!
    private var _attachmentExists:Bool!
    private var _attachimage:String!
    private var _givenBy:String!
    
    var cwDate : String{
        get {
            return _cwDate
            
        }
        set
        {
            _cwDate = newValue
        }
        }
    
    

    var subject:String
    {
        return _subject
        
    }
    var subjectText:String
    {
        return _subjectText
        
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
    
    var givenBy:String{
        get{
            return _givenBy
        }
        set{
            _givenBy=givenBy
        }
    }
    
    
    init(subject:String,subjectText:String,attachmentExists:Bool,attachimage:String)
    {
        _subject=subject
        _subjectText=subjectText
        _attachmentExists=attachmentExists
        _attachimage=attachimage
    }
    
    init(subject:String,subjectText:String,attachmentExists:Bool,attachimage:String,gevinBy:String,cwDate:String)
    {
        _subject=subject
        _subjectText=subjectText
        _attachmentExists=attachmentExists
        _attachimage=attachimage
        _cwDate = cwDate
    }
    init() {
        
    }
    

}
