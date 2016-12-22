//
//  ViewStarModel.swift
//  ParentViewStar
//
//  Created by Mac on 21/11/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation

class ViewStarModel{
    
    fileprivate var _starDate: String!
    fileprivate var _starComment: String!
    fileprivate var _starImageUrl: String!
    
    var starDate : String{
        return _starDate
    }
    
    var starComment: String{
        return _starComment
    }
    
    var starImageUrl:String{
        
        return _starImageUrl
    }
    
    init(starDate:String, starComment:String, starImageUrl:String)
    {
        _starDate = starDate
        _starComment = starComment
        _starImageUrl = starImageUrl
    }
    
}
