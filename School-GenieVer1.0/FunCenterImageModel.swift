//
//  FunCenterImageModel.swift
//  TestApp
//
//  Created by Mac on 06/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class FunCenterImageModel:Mappable {
    
    var CreateTime:String?
    var EventId:String?
    var ImageCaption:String?
    var ImageId:String?
    var SrNo:Int?
    var fileName:String?
    var uploadDate:String?
    
    required init?(map: Map) {
        
       
        CreateTime = map["CreateTime"].value()        
        EventId = map["EventId"].value()
        ImageCaption = map["ImageCaption"].value()
        ImageId = map["ImageId"].value()
        SrNo = map["SrNo"].value()
        fileName = map["fileName"].value()
        uploadDate = map["uploadDate"].value()
        
    }
    
    func mapping(map: Map) {
        
    }
    
    init() {
        
    }
    
    func setImages(createTime:String, imageCaption:String, uploaddate:String, imageId:String, srNo:Int, filename:String, eventId:String){
        CreateTime = createTime
        ImageCaption = imageCaption
        uploadDate = uploaddate
        EventId = eventId
        fileName = filename
        SrNo = srNo
    }
    
}
