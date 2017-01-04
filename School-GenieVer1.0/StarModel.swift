//
//  StarModel.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 03/01/17.
//  Copyright © 2017 Realizer. All rights reserved.
//

import Foundation
import ObjectMapper

class StarModels: Mappable{
    
    var NotiType:String?
    var Subject:String?
    var StarDate:String?
    var Comment:String?
    var TeacherName:String?
    var TeacherLoginId:String?
    var Star:String?
    
    required init?(map: Map) {
        
        NotiType = map["NotiType"].value()
        Subject = map["Subject"].value()
        StarDate = map["StarDate"].value()
        StarDate = map["StarDate"].value()
        Comment = map["Comment"].value()
        TeacherName = map["TeacherName"].value()
        TeacherLoginId = map["TeacherLoginId"].value()
        Star = map["Star"].value()
    }
    
    func mapping(map: Map) {
    }
    
    init() {
        
    }
    
    func setValue(notitype:String, subject:String, stardate:String, comment:String, teachername:String, teacherloginid:String, star:String){
        
        NotiType = notitype
        Subject = subject
        StarDate = stardate
        Comment = comment
        TeacherName = teachername
        TeacherLoginId = teacherloginid
        Star = star
        
    }
    
}
