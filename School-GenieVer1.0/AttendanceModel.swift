//
//  AttendanceModel.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class AttendanceModel:Mappable {
    
    
    var AttendanceId:String?
    var attendanceDate:String?
    var SchoolCode:String?
    var Std:String?
    var Div:String?
    var AttendanceBy:String?
    var Attendees:String?
    var Absenties:String?
    var PresenceCnt:Int?
    var AbsentCnt:Int?
    var attDate:String?
    var isPresent:Bool?
    
    required init?(map: Map) {
        
        /*AttendanceId = map["AttendanceId"].value()
        attendanceDate = map["attendanceDate"].value()
        SchoolCode = map["SchoolCode"].value()
        Std = map["Std"].value()
        Div = map["Div"].value()
        AttendanceBy = map["AttendanceBy"].value()
        Attendees = map["Attendees"].value()
        Absenties = map["Absenties"].value()*/
        
        attDate = map["attDate"].value()
        isPresent = map["isPresent"].value()
        
    }
    
    func mapping(map: Map) {
        
    }
    
}
