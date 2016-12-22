//
//  HomeWork.swift
//  
//
//  Created by sachin shinde on 16/11/16.
//
//

import Foundation
class HomeWork
{
    private var _hwDate:String!
    private var _subject:String!
    private var _subjectText:String!
    private var _attachmentExists:Bool!
    private var _attachimage:String!
    private var _givenBy:String!
    
    var hwDate : String{
        get {
            return _hwDate
            
        }
        set
        {
            _hwDate = newValue
        }
    }
    
    
    
    var subject:String{
        get{
            return _subject
        }
        set{
            _subject=subject
        }
    }

    var subjectText:String{
        get{
            return _subjectText
        }
        set{
            _subjectText=subjectText
        }
    }

    var attachmentExists:Bool{
        get{
            return _attachmentExists
        }
        set{
            _attachmentExists=attachmentExists
        }
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
            if(givenBy.isEmpty){
               _givenBy = " "
                
            }
            else{
            _givenBy=givenBy
            }
        }
    }
    
    init(subject:String,subjectText:String,attachmentExists:Bool,attachimage:String)
    {
        _subject=subject
        _subjectText=subjectText
        _attachmentExists=attachmentExists
        _attachimage=attachimage
    }
    init(subject:String,subjectText:String,attachmentExists:Bool,attachimage:String,givenby:String,hwDate:String)
    {
        _subject=subject
        _subjectText=subjectText
        _attachmentExists=attachmentExists
        _attachimage=attachimage
        _givenBy = givenby
        _hwDate = hwDate
    }
    
    init() {
        
    }
    
    
}
