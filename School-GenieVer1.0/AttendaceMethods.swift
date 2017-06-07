//
//  AttendaceMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class AttendaceMethods{
    
    func storeAttendace (attendace: [AttendanceModel]) {
        let context = getContext()
        
        deleteAttendace()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "AttendanceCoreData", in: context)
        
        for attobj in attendace as [AttendanceModel]
        {
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            //set the entity values
            transc.setValue(attobj.attDate, forKey: "attDate")
            transc.setValue(attobj.isPresent, forKey: "isPresent")
            
            
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
    
    
    func getAttendace() -> [AttendanceModel]{
        
        var attList = [AttendanceModel]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "AttendanceCoreData")
        //let fetchRequest: NSFetchRequest<PupilInformation> = PupilInformation.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                var attModel = AttendanceModel()
                var dateatt:String = ""
                var presentsta:Bool = true
                
                if(trans.value(forKey: "attDate") != nil){
                    dateatt = trans.value(forKey: "attDate") as! String
                }
                if(trans.value(forKey: "isPresent") != nil){
                    presentsta = trans.value(forKey: "isPresent") as! Bool
                }
                
                attModel.setUpValue(attdate: dateatt, ispresent: presentsta)
                attList.append(attModel)
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return attList
    }
    
    
    func deleteAttendace(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "AttendanceCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}

