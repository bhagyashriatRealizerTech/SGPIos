//
//  Homework.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class HomeworkModel:Mappable{
    
    
    var SchoolCode:String?
    var hwDate:String?
    var Std:String?
    var div:String?
    var subject:String?
    var hwTxtLst:Array<String>?
    var hwImage64Lst:Array<String>?
    var givenBy:String?
    
    required init?(map: Map) {
        
        SchoolCode = map["SchoolCode"].value()
        hwDate = map["hwDate"].value()
        Std = map["Std"].value()
        div = map["div"].value()
        subject = map["subject"].value()
        hwTxtLst = map["hwTxtLst"].value()
        hwImage64Lst = map["hwImage64Lst"].value()
        givenBy = map["givenBy"].value()
    }
    
    func mapping(map: Map) {
        
    }
}
