//
//  ClassworkMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation

import CoreData

class ClassworkMethods{
    
    func storeClasswork (classwork: ClassworkModel) {
        let context = getContext()
        
        //deleteClasswork()
        
        if(classwork.cwImage64Lst?.count == 0 && classwork.CwTxtLst?.count == 0)
        {
            
        }
        else{
            
            let date1:Date = Date()
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date1)
            
            let currentY:Int = components.year!
            let currentM:Int = components.month!
            let currentD:Int = components.day!
            
            let syncDate = String(currentY)+"/"+String(currentM)+"/"+String(currentD)
            
            
            
            //retrieve the entity that we just created
            let entity =  NSEntityDescription.entity(forEntityName: "ClassworkCoreData", in: context)
            
            
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            
            //set the entity values
            transc.setValue(classwork.SchoolCode, forKey: "schoolCode")
            transc.setValue(classwork.cwDate, forKey: "cwDate")
            transc.setValue(classwork.Std, forKey: "std")
            transc.setValue(classwork.div, forKey: "div")
            transc.setValue(classwork.subject, forKey: "subject")
            transc.setValue(classwork.CwTxtLst?.joined(separator: "@@@"), forKey: "cwTxtLst")
            transc.setValue(classwork.cwImage64Lst?.joined(separator: "@@@"), forKey: "cwImage64Lst")
            transc.setValue(classwork.givenBy, forKey: "givenBy")
            transc.setValue(syncDate, forKey: "lastSyncdateCw")
            
            
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
    
    
    func getClasswork(date:String) -> [ClassWork] {
        
        var classwork = ClassWork()
        var classworkList = [ClassWork]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ClassworkCoreData")
        let date1:String = date
        let predicate = NSPredicate(format: "cwDate == %@", date1)
        fetchRequest.predicate = predicate
        //let fetchRequest: NSFetchRequest<PupilInformation> = PupilInformation.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                var subject:String = ""
                if(trans.value(forKey: "subject") != nil){
                    subject = trans.value(forKey: "subject") as! String
                }
                var cwDate:String = ""
                if(trans.value(forKey: "cwDate") != nil){
                    cwDate = trans.value(forKey: "cwDate") as! String
                }
                var cwText:String = ""
                if(trans.value(forKey: "cwTxtLst") != nil){
                    cwText = trans.value(forKey: "cwTxtLst") as! String
                }
                var cwImage:String = ""
                if(trans.value(forKey: "cwImage64Lst") != nil){
                    cwImage = trans.value(forKey: "cwImage64Lst") as! String
                }
                var givenBy:String = ""
                if(trans.value(forKey: "givenBy") != nil){
                    givenBy = trans.value(forKey: "givenBy") as! String
                }
                
                if(cwImage.isEmpty){
                    classwork = ClassWork(subject: subject, subjectText: cwText, attachmentExists: false, attachimage: "", gevinBy: givenBy, cwDate: cwDate)
                }
                else{
                    classwork = ClassWork(subject: subject, subjectText: cwText, attachmentExists: true, attachimage: cwImage, gevinBy: givenBy, cwDate: cwDate)
                }
                classworkList.append(classwork)
                //print("\(trans.value(forKey: "fName"))")
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        return classworkList
    }
    
    
    func getLastClassworkDate() ->String {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ClassworkCoreData")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastSyncdateCw", ascending: false)]
        fetchRequest.fetchLimit = 1
        var datesync:String = ""
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                if(trans.value(forKey: "lastSyncdateCw") != nil){
                    datesync = trans.value(forKey: "lastSyncdateCw") as! String
                }
                //print(datesync)
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return datesync
    }
    func getAllClassworkDate() ->[String] {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ClassworkCoreData")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastSyncdateCw", ascending: false)]
        var datesync=""
        var date:[String]=[]
        do {
            //go get the results
            var searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                if(trans.value(forKey: "cwDate") != nil){
                    datesync = trans.value(forKey: "cwDate") as! String
                    //searchResults.append(datesync)
               date.append(datesync)
                }
                //print(datesync)
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return date
    }

    
    func getClassworkSubjectForDate(date:String) ->[String] {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ClassworkCoreData")
        let date1:String = date
        let predicate = NSPredicate(format: "cwDate == %@", date1)
        fetchRequest.predicate = predicate
        var subjects = [String]()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                var sub:String = ""
                if(trans.value(forKey: "subject") != nil){
                    sub = trans.value(forKey: "subject") as! String
                    subjects.append(sub)
                }
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return subjects
    }
    
    
    
    func deleteClasswork(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ClassworkCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}

