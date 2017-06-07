//
//  StudentDetail+CoreDataProperties.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 13/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData


extension StudentDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentDetail> {
        return NSFetchRequest<StudentDetail>(entityName: "StudentDetail");
    }

    @NSManaged public var registrationcode: String?
    @NSManaged public var thumbnailurl: String?
    @NSManaged public var academicyear: String?
    @NSManaged public var address: String?
    @NSManaged public var bldgrp: String?
    @NSManaged public var classrollno: String?
    @NSManaged public var comments: String?
    @NSManaged public var contactno: String?
    @NSManaged public var division: String?
    @NSManaged public var dob: String?
    @NSManaged public var emailid: String?
    @NSManaged public var emergencyno: String?
    @NSManaged public var fname: String?
    @NSManaged public var lname: String?
    @NSManaged public var fathername: String?
    @NSManaged public var hobbies: String?
    @NSManaged public var isactive: Bool
    @NSManaged public var mname: String?
    @NSManaged public var magicword: String?
    @NSManaged public var mothername: String?
    @NSManaged public var password: String?
    @NSManaged public var rollno: Int32
    @NSManaged public var schoolcode: String?
    @NSManaged public var smallthumburl: String?
    @NSManaged public var std: String?
    @NSManaged public var userid: String?

}
