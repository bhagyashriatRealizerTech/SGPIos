//
//  PupilInformationMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 13/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class PupilInformationMethods{
    
    func storeStudentDetail (studentdetail: StudentDetail) {
        let context = getContext()
        
        deleteStudentDetail()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "PupilInformation", in: context)
        
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        transc.setValue(studentdetail.ThumbnailURL, forKey: "thumbnailUrl")
        transc.setValue(studentdetail.RegistrationCodes?.joined(separator: ","), forKey: "registrationCode")
        transc.setValue(studentdetail.academicYear, forKey: "academicYear")
        transc.setValue(studentdetail.address, forKey: "address")
        
        transc.setValue(studentdetail.bldGrp, forKey: "bldGrp")
        transc.setValue(Int(studentdetail.classRollNo!), forKey: "classRollNo")
        transc.setValue(studentdetail.comments, forKey: "comments")
        transc.setValue(studentdetail.contactNo, forKey: "contactNo")
        transc.setValue(studentdetail.division, forKey: "division")
        transc.setValue(studentdetail.dob, forKey: "dob")
        //transc.setValue(studentdetail.ActiveTill, forKey: "activetill")
        transc.setValue(studentdetail.emailId, forKey: "emailId")
        transc.setValue(studentdetail.emergencyContactNo, forKey: "emergencyContactNo")
        transc.setValue(studentdetail.fName, forKey: "fName")
        transc.setValue(studentdetail.fatherName, forKey: "fatherName")
        transc.setValue(studentdetail.hobbies, forKey: "hobbies")
        
        
        transc.setValue(studentdetail.isActive, forKey: "isActive")
        transc.setValue(studentdetail.lName, forKey: "lName")
        transc.setValue(studentdetail.mName, forKey: "mName")
        transc.setValue(studentdetail.magicWord, forKey: "magicWord")
        
        transc.setValue(studentdetail.motherName, forKey: "motherName")
        transc.setValue(studentdetail.pwd, forKey: "pwd")
        transc.setValue(String(describing: studentdetail.rollNo), forKey: "rollNo")
        transc.setValue(studentdetail.schoolCode, forKey: "schoolCode")
        
        transc.setValue(studentdetail.smallThumbnailURL, forKey: "smallThumbnailURL")
        transc.setValue(studentdetail.std, forKey: "std")
        transc.setValue(studentdetail.userId, forKey: "userId")
        
        
        
        
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    
    
    func getStudentDetail() -> StudentDetail {
        
        
        var studedetail = StudentDetail()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "PupilInformation")
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                
                let temp =  trans.value(forKey: "fName")
                print(temp)
                studedetail = setValue(nsObj: trans)
                
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return studedetail
    }
    
    func setValue(nsObj: NSManagedObject) -> StudentDetail
    {
        var thumburl:String = ""
        var regcode: [String] = [""]
        var academicYear:String = ""
        var adrs:String = ""
        var bldgrp:String = ""
        var clasrno:Int = 0
        var comnts:String = ""
        var contctno:String = ""
        var div:String = ""
        var dob:String = ""
        var emailid:String = ""
        var emrgncyno:String = ""
        var fname:String = ""
        var fathername:String = ""
        var hobs:String = ""
        var isactive:Bool = true
        var lname:String = ""
        var mname:String = ""
        var magicwrd:String = ""
        var mothrname:String = ""
        var password:String = ""
        var rno:Int = 0
        var schoolcode:String = ""
        var smallthumburl:String = ""
        var std:String = ""
        var userid:String = ""
        
        
        if(nsObj.value(forKey: "thumbnailUrl") != nil){
            thumburl = nsObj.value(forKey: "thumbnailUrl")! as! String
        }
        if((nsObj.value(forKey: "registrationCode")) != nil)
        {
            let regcode1 = nsObj.value(forKey: "registrationCode") as! String
            regcode = regcode1.components(separatedBy: ",")
        }
        if((nsObj.value(forKey: "academicYear")) != nil)
        {
            academicYear = nsObj.value(forKey: "academicYear")! as! String
        }
        if((nsObj.value(forKey: "address")) != nil)
        {
            adrs = nsObj.value(forKey: "address")! as! String
            
        }
        if((nsObj.value(forKey: "bldGrp")) != nil)
        {
            bldgrp = nsObj.value(forKey: "bldGrp")! as! String
            
        }
        
        if((nsObj.value(forKey: "classRollNo")) != nil)
        {
            clasrno = nsObj.value(forKey: "classRollNo")! as! Int
        }
        
        if((nsObj.value(forKey: "comments")) != nil)
        {
            comnts = nsObj.value(forKey: "comments")! as! String
            
        }
        
        if((nsObj.value(forKey: "contactNo")) != nil)
        {
            contctno = nsObj.value(forKey: "contactNo")! as! String
        }
        
        if((nsObj.value(forKey: "contactNo")) != nil)
        {
            contctno = nsObj.value(forKey: "contactNo")! as! String
        }
        if((nsObj.value(forKey: "division")) != nil)
        {
            div = nsObj.value(forKey: "division")! as! String
        }
        if((nsObj.value(forKey: "dob")) != nil)
        {
            dob = nsObj.value(forKey: "dob")! as! String
        }
        if((nsObj.value(forKey: "emailId")) != nil)
        {
            emailid = nsObj.value(forKey: "emailId")! as! String
        }
        if((nsObj.value(forKey: "emailId")) != nil)
        {
            emailid = nsObj.value(forKey: "emailId")! as! String
        }
        if((nsObj.value(forKey: "emailId")) != nil)
        {
            emailid = nsObj.value(forKey: "emailId")! as! String
        }
        if((nsObj.value(forKey: "emergencyContactNo")) != nil)
        {
            emrgncyno = nsObj.value(forKey: "emergencyContactNo")! as! String
        }
        if((nsObj.value(forKey: "fName")) != nil)
        {
            fname = nsObj.value(forKey: "fName")! as! String
            
        }
        if((nsObj.value(forKey: "fatherName")) != nil)
        {
            fathername = nsObj.value(forKey: "fatherName")! as! String
            
        }
        if((nsObj.value(forKey: "hobbies")) != nil)
        {
            hobs = nsObj.value(forKey: "hobbies")! as! String
            
        }
        if((nsObj.value(forKey: "isActive")) != nil)
        {
            isactive = nsObj.value(forKey: "isActive")! as! Bool
            
        }
        if((nsObj.value(forKey: "lName")) != nil)
        {
            lname = nsObj.value(forKey: "lName")! as! String
            
        }
        
        if((nsObj.value(forKey: "mName")) != nil)
        {
            mname = nsObj.value(forKey: "mName")! as! String
            
        }
        if((nsObj.value(forKey: "magicWord")) != nil)
        {
            magicwrd = nsObj.value(forKey: "magicWord")! as! String
            
        }
        if((nsObj.value(forKey: "motherName")) != nil)
        {
            mothrname = nsObj.value(forKey: "motherName")! as! String
        }
        if((nsObj.value(forKey: "pwd")) != nil)
        {
            password = nsObj.value(forKey: "pwd")! as! String
            
        }
        if((nsObj.value(forKey: "rollNo")) != nil)
        {
            rno = Int("0")!
            
        }
        if((nsObj.value(forKey: "schoolCode")) != nil)
        {
            schoolcode = nsObj.value(forKey: "schoolCode")! as! String
            
        }
        if((nsObj.value(forKey: "smallThumbnailURL")) != nil)
        {
            smallthumburl = nsObj.value(forKey: "smallThumbnailURL")! as! String
            
        }
        if((nsObj.value(forKey: "std")) != nil)
        {
            std = nsObj.value(forKey: "std")! as! String
            
            
        }
        if((nsObj.value(forKey: "userId")) != nil)
        {
            userid = nsObj.value(forKey: "userId")! as! String
        }
        
        let studedtl = StudentDetail()
        
        
        studedtl.setStudentdetail(_ActiveTill: "", _RegistrationCodes: regcode, _ThumbnailURL: thumburl, _academicYear: academicYear, _address: adrs, _bldGrp: bldgrp, _classRollNo: clasrno, _comments: comnts, _contactNo: contctno, _division: div, _dob: dob, _emailId: emailid, _emergencyContactNo: emrgncyno, _fName: fname, _fatherName: fathername, _hobbies: hobs, _isActive: isactive, _lName: lname, _mName: mname, _magicWord: magicwrd, _motherName: mothrname, _pwd: password, _rollNo: rno, _schoolCode: schoolcode, _smallThumbnailURL: smallthumburl, _std: std, _userId: userid)
        
        return studedtl
        
    }
    
    func deleteStudentDetail(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "PupilInformation")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}
