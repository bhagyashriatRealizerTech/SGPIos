//
//  SubjectAllocationMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 14/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class SubjectAllocationMethods{
    
    func storeSubjectAllocation (subjectallocation: SubjectAllocate) {
        let context = getContext()
        
        deleteSubjectAllocation()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "SubjectAllocationCoreData", in: context)
        
        for subobj in subjectallocation.subjAllocation! as [SubjectAllocation]
        {
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            //set the entity values
            transc.setValue(subobj.TeacherName, forKey: "teacherName")
            transc.setValue(subobj.TeacherUserId, forKey: "teacherUserId")
            transc.setValue(subobj.ThumbNailURL, forKey: "thumbNailURL")
            transc.setValue(subobj.division, forKey: "division")
            transc.setValue(subobj.smallThumbNailURL, forKey: "smallThumbNailURL")
            transc.setValue(subobj.subject, forKey: "subject")
            
            
            //save the object
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
        }
        
    }
    
    
    func getAllSubjects() -> [String] {
        
        var subjects = [String]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "SubjectAllocationCoreData")
        //let fetchRequest: NSFetchRequest<PupilInformation> = PupilInformation.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                var sub = ""
                if(trans.value(forKey: "subject") != nil){
                    sub = trans.value(forKey: "subject") as! String
                }
                print(sub)
                subjects.append(sub)
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return subjects
    }
    
    
    func getAllTeacher() -> [SubjectAllocation] {
        
        var teacherlist = [SubjectAllocation]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "SubjectAllocationCoreData")
        //let fetchRequest: NSFetchRequest<PupilInformation> = PupilInformation.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                
                var teacher = SubjectAllocation()
                
                var sub = ""
                if(trans.value(forKey: "subject") != nil){
                    sub = trans.value(forKey: "subject") as! String
                }
                
                var name = ""
                if(trans.value(forKey: "teacherName") != nil){
                    name = trans.value(forKey: "teacherName") as! String
                }
                
                var userid = ""
                if(trans.value(forKey: "teacherUserId") != nil){
                    userid = trans.value(forKey: "teacherUserId") as! String
                }
                
                var profilrurl = ""
                if(trans.value(forKey: "thumbNailURL") != nil){
                    profilrurl = trans.value(forKey: "thumbNailURL") as! String
                }
                
                teacher.setUpValue(tname: name, userId: userid, url: profilrurl, Subject: sub)
                teacherlist.append(teacher)
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return teacherlist
    }
    

    
    func deleteSubjectAllocation(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "SubjectAllocationCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
    
}



