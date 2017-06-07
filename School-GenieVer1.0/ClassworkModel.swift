//
//  Classwork.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class ClassworkModel: Mappable{
    
    var SchoolCode:String?
    var cwDate:String?
    var Std:String?
    var div:String?
    var subject:String?
    var CwTxtLst:Array<String>?
    var cwImage64Lst:Array<String>?
    var givenBy:String?
    
    required init?(map: Map) {
        
        SchoolCode = map["SchoolCode"].value()
        cwDate = map["cwDate"].value()
        Std = map["Std"].value()
        div = map["div"].value()
        subject = map["subject"].value()
        CwTxtLst = map["CwTxtLst"].value()
        cwImage64Lst = map["cwImage64Lst"].value()
        givenBy = map["givenBy"].value()
    }
    
    func mapping(map: Map) {
        
    }

}
