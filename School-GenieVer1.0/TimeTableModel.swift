//
//  TimeTableModel.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class TimeTableModel:Mappable {
    
    var schoolCode:String?
    var Std:String?
    var division:String?
    var AcademicYr:String?
    var TimeTableText:String?
    var Description:String?
    var UploadDate:String?
    var TimeTableImage:String?
    var UploadedBy:String?
    var fileName:String?
    
    required init?(map: Map) {
        
        schoolCode = map["schoolCode"].value()
        Std = map["Std"].value()
        division = map["division"].value()
        AcademicYr = map["AcademicYr"].value()
        TimeTableText = map["TimeTableText"].value()
        Description = map["Description"].value()
        UploadDate = map["UploadDate"].value()
        TimeTableImage = map["TimeTableImage"].value()
        UploadedBy = map["UploadedBy"].value()
        fileName = map["fileName"].value()
        
    }
    
    func mapping(map: Map) {
        
    }
}
