//
//  StudentDetail.swift
//  TestApp
//
//  Created by Mac on 05/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import ObjectMapper

class StudentDetail : Mappable{
    
    var ActiveTill : String?
    var RegistrationCodes: [String]?
    var ThumbnailURL: String?
    var academicYear: String?
    var address: String?
    var bldGrp:String?
    var classRollNo:Int?
    var comments:String?
    var contactNo: String?
    var division : String?
    var dob : String?
    var emailId : String?
    var emergencyContactNo : String?
    var fName : String?
    var fatherName : String?
    var hobbies : String?
    var isActive : Bool?
    var lName : String?
    var mName : String?
    var magicWord : String?
    var motherName : String?
    var pwd : String?
    var rollNo : Int?
    var schoolCode : String?
    var smallThumbnailURL: String?
    var std : String?
    var userId : String?
   
    
    required init?(map: Map) {
        
        
        let activetill: String = map["ActiveTill"].value()!
        //self.ActiveTill = NSDate(timeIntervalSince1970: activetill.doubleValue)
        self.ActiveTill = activetill
        
        let regicodes: [String]? = map["RegistrationCodes"].value()
        self.RegistrationCodes = regicodes
        
        let thumbnailurl: String? = map["ThumbnailURL"].value()
        self.ThumbnailURL = thumbnailurl
        
        let academicY: String? = map["academicYear"].value()
        self.academicYear = academicY
        
        let addrs: String? = map["address"].value()
        self.address = addrs
        
        let bldgp: String? = map["bldGrp"].value()
        self.bldGrp = bldgp
        
        let classrno: Int? = map["classRollNo"].value()
        self.classRollNo = classrno
        
        let comment:String? = map["comments"].value()
        self.comments = comment
        
        let contactNumber: String? = map["contactNo"].value()
        self.contactNo = contactNumber
        
        let div:String? = map["division"].value()
        self.division = div
        
        
        let tempdate:String = map["dob"].value()!
        //self.dob = NSDate(timeIntervalSince1970: tempdate.doubleValue)
        self.dob = tempdate
        
        
        let email: String? = map["emailId"].value()
        self.emailId = email
        
        let emrgncyContact: String? = map["emergencyContactNo"].value()
        self.emergencyContactNo = emrgncyContact
        
        let firstName:String? = map["fName"].value()
        self.fName = firstName
    
        let fthrName:String? = map["fatherName"].value()
        self.fatherName = fthrName
        
        let active:Bool? = map["isActive"].value()
        self.isActive = active
    
        let lastName:String? = map["lName"].value()
        self.lName = lastName
        
        let middleName:String? = map["mName"].value()
        self.mName = middleName
        
        let mgicword:String? = map["magicWord"].value()
        self.magicWord = mgicword
        
        let _motherName:String? = map["motherName"].value()
        self.motherName = _motherName
        
        let password:String? = map["pwd"].value()
        self.pwd = password
        
        let _rollNo:Int? = map["rollNo"].value()
        self.rollNo = _rollNo
        
        let _schoolCode:String? = map["schoolCode"].value()
        self.schoolCode = _schoolCode
        
        let smlthumburl:String? = map["smallThumbnailURL"].value()
        self.smallThumbnailURL = smlthumburl
        
        let _std:String? =  map["std"].value()
        self.std = _std
        
        let _userId:String? = map["userId"].value()
        self.userId = _userId
        
        mapping(map: map)
        
        
    }
    
    init() {
        
    }
    // Mappable
    func mapping(map: Map) {
        
        self.academicYear <- map["academicYear"]
        self.classRollNo <- map["classRollNo"]
           }
    
   
    func setStudentdetail(_ActiveTill : String,_RegistrationCodes: [String],
    _ThumbnailURL: String,_academicYear: String,_address: String,_bldGrp:String,
    _classRollNo:Int,_comments:String,_contactNo: String,_division : String,_dob :String,_emailId : String,_emergencyContactNo : String,_fName : String,
    _fatherName : String,_hobbies : String,_isActive : Bool,_lName : String,_mName : String,_magicWord : String,_motherName : String,_pwd : String,_rollNo : Int,
    _schoolCode : String,_smallThumbnailURL: String,_std : String,_userId : String){
        
        
        self.RegistrationCodes = _RegistrationCodes
        self.ThumbnailURL = _ThumbnailURL
        self.academicYear = _academicYear
        self.address = _address
        self.bldGrp = _bldGrp
        self.classRollNo = _classRollNo
        self.comments = _comments
        self.contactNo = _contactNo
        self.division = _division
        self.dob = _dob
        self.emailId = _emailId
        self.emergencyContactNo = _emergencyContactNo
        self.fName = _fName
        self.fatherName = _fatherName
        self.isActive = _isActive
        self.lName = _lName
        self.mName = _mName
        self.magicWord = _magicWord
        self.motherName = _motherName
        self.pwd = _pwd
        self.rollNo = _rollNo
        self.schoolCode = _schoolCode
        self.smallThumbnailURL = _smallThumbnailURL
        self.std = _std
        self.userId = _userId

    }
    
}
