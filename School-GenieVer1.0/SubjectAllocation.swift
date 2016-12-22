//
//  SubjectAllocation.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class SubjectAllocation:Mappable{
    
    var Std:String?
    var TeacherName:String?
    var TeacherUserId:String?
    var ThumbNailURL:String?
    var division:String?
    var smallThumbNailURL:String?
    var subject:String?
    
    
    required init?(map: Map) {
        
        Std = map["Std"].value()
        TeacherName = map["TeacherName"].value()
        TeacherUserId = map["TeacherUserId"].value()
        ThumbNailURL = map["ThumbNailURL"].value()
        division = map["division"].value()
        smallThumbNailURL = map["smallThumbNailURL"].value()
        subject  = map["subject"].value()
        
    }
    
    func mapping(map: Map) {
        
    }
}
