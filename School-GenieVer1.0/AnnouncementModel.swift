//
//  AnnouncementModel.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class AnnouncementModel:Mappable {
    
    var SchoolCode:String?
    var AnnouncementId:String?
    var Std:String?
    var division:String?
    var AcademicYr:String?
    var AnnouncementText:String?
    var Category:String?
    var sentBy:String?
    var createTS:String?
    
    
    required init?(map: Map) {
        
        
        SchoolCode = map["SchoolCode"].value()
        AnnouncementId = map["AnnouncementId"].value()
        Std = map["Std"].value()
        division = map["division"].value()
        AcademicYr = map["AcademicYr"].value()
        AnnouncementText = map["AnnouncementText"].value()
        Category = map["Category"].value()
        sentBy = map["sentBy"].value()
        createTS = map["createTS"].value()
        
    }
    
    func mapping(map: Map) {
        
    }
    
}
