//
//  ViewStarModel.swift
//  ParentViewStar
//
//  Created by Mac on 21/11/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation

class ViewStarModel{
    
    private var _starDate: String!
    private var _starComment: String!
    private var _starName: String!
    private var _teacherName: String!
    private var _teacherPic: String!
    private var _starSubject: String!
    
    var starDate : String{
        return _starDate
    }
    
    var starComment: String{
        return _starComment
    }
    
    var starName:String{
        
        return _starName
    }
    
    var starSubject : String{
        return _starSubject
    }
    
    var teacherName: String{
        return _teacherName
    }
    
    var teacherPic:String{
        
        return _teacherPic
    }
    
    init() {
        
    }
    

    init(starDate:String, starComment:String, starName:String, teacherName:String, teacherPic:String, starSubject:String)
    {
        _starDate = starDate
        _starComment = starComment
        _starName = starName
        _starSubject = starSubject
        _teacherName = teacherName
        _teacherPic = teacherPic
    }
    
}
