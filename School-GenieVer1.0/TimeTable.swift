//
//  TimeTable.swift
//  ParentViewStar
//
//  Created by Mac on 23/11/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation

class TimeTable{
    
    fileprivate var _timeTableGivenby: String!
    fileprivate var _timeTableDate: String!
    fileprivate var _timeTableTitle: String!
    fileprivate var _timeTableAttachment: Bool!
    fileprivate var _timeTableDesc: String!
    fileprivate var _timeTableAttachmentUrl: String!
    
   
    var timeTableGivenby :String{
        
        get{
            if(_timeTableGivenby == nil){
                return ""
            }
            else{
                return _timeTableGivenby
                
            }
        }
        set{
            if(timeTableGivenby.isEmpty){
                _timeTableGivenby = ""
                
            }
            else{
                _timeTableGivenby=timeTableGivenby
            }
        }
        
    }

    
    var timeTableDate :String{
       
        get{
            if(_timeTableDate == nil){
                return ""
            }
            else{
                return _timeTableDate
                
            }
        }
        set{
            if(timeTableDate.isEmpty){
                _timeTableDate = ""
                
            }
            else{
                _timeTableDate = timeTableDate
            }
        }

    }
    
    var timeTableTitle : String{
        
        get{
            if(_timeTableTitle == nil){
            return ""
            }
            else{
                return _timeTableTitle

            }
        }
        set{
            if(timeTableTitle.isEmpty){
                _timeTableTitle = ""
                
            }
            else{
                _timeTableTitle=timeTableTitle
            }
        }

    }
    
    var timeTableAttachment : Bool{
        
        get{
            return (_timeTableAttachment != nil)
        }
        set{
            
            _timeTableAttachment = timeTableAttachment
            
        }

    }
    
    var timeTableDesc: String{
        
        get{
            if(_timeTableDesc == nil){
                return ""
            }
            else{
                return _timeTableDesc
            }
        }
        set{
            if(timeTableDesc.isEmpty){
                _timeTableDesc = ""
                
            }
            else{
                _timeTableDesc = timeTableDesc
            }
        }

    }
    
    var timeTableAttachmentUrl: String{
       
        get{
            if(_timeTableAttachmentUrl == nil){
                return ""
            }
            else{
                return _timeTableAttachmentUrl
            }        }
        set{
            if(timeTableAttachmentUrl.isEmpty){
                _timeTableAttachmentUrl = ""
                
            }
            else{
                _timeTableAttachmentUrl = timeTableAttachmentUrl
            }
        }

    }
    
    init(timetableGivenBy: String , timeTableDate: String, timeTableTitle: String, timeTableAttachment : Bool)
        
    {
        _timeTableGivenby = timetableGivenBy
        _timeTableDate = timeTableDate
        _timeTableTitle = timeTableTitle
        _timeTableAttachment = timeTableAttachment
        
    }
    
    init(timetableGivenBy: String , timeTableDate: String, timeTableTitle: String, timeTableAttachment : Bool, timeTableDesc: String, timeTableAttachmentUrl: String)
        
    {
        _timeTableGivenby = timetableGivenBy
        _timeTableDate = timeTableDate
        _timeTableTitle = timeTableTitle
        _timeTableAttachment = timeTableAttachment
        _timeTableAttachmentUrl = timeTableAttachmentUrl
        _timeTableDesc = timeTableDesc
        
    }
    init() {
        
    }
    
}
