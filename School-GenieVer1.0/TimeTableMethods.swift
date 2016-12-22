//
//  TimeTableMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class TimeTableMethods{
    
    func storeTimeTable (timetables: [TimeTableModel]) {
        let context = getContext()
        
        
        if(timetables.count == 0)
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
            let entity =  NSEntityDescription.entity(forEntityName: "TimeTableCoreData", in: context)
            
            for timetable in timetables as [TimeTableModel]
            {
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            
            //set the entity values
            transc.setValue(timetable.schoolCode, forKey: "schoolCode")
            transc.setValue(timetable.Std, forKey: "std")
            transc.setValue(timetable.division, forKey: "division")
            transc.setValue(timetable.AcademicYr, forKey: "academicYr")
            transc.setValue(timetable.Description, forKey: "descriptiontxt")
            transc.setValue(timetable.UploadedBy, forKey: "uploadedBy")
            transc.setValue(timetable.fileName, forKey: "fileName")
            transc.setValue(timetable.TimeTableText, forKey: "timeTableText")
            transc.setValue(timetable.UploadDate, forKey: "uploadDate")
            transc.setValue(timetable.TimeTableImage, forKey: "timeTableImage")
            transc.setValue(syncDate, forKey: "lastSyncUpDate")
            
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
        
    }
    
    
    func getTimeTable() -> [TimeTable] {
        
        var timeTableList = [TimeTable]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "TimeTableCoreData")
        //let fetchRequest: NSFetchRequest<PupilInformation> = PupilInformation.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                var timeTable = TimeTable()
                //get the Key Value pairs (although there may be a better way to do that...
                let title:String = trans.value(forKey: "timeTableText") as! String
                let description:String  = trans.value(forKey: "descriptiontxt")as! String
                let givenby:String = trans.value(forKey: "uploadedBy")as! String
                let dateT:String = trans.value(forKey: "uploadDate")as! String
                let images:String  = trans.value(forKey: "timeTableImage")as! String
                print(images)
                
                if(images.isEmpty){
                    timeTable = TimeTable(timetableGivenBy: givenby, timeTableDate: dateT, timeTableTitle: title, timeTableAttachment: false, timeTableDesc: description, timeTableAttachmentUrl: "")
                }
                else{
                     timeTable = TimeTable(timetableGivenBy: givenby, timeTableDate: dateT, timeTableTitle: title, timeTableAttachment: true, timeTableDesc: description, timeTableAttachmentUrl: images)
                }
                
                timeTableList.append(timeTable)
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return timeTableList
    }
    
    //Get Last Date
    
    func getLastTimeTableDate() ->String {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "TimeTableCoreData")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastSyncUpDate", ascending: false)]
        fetchRequest.fetchLimit = 1
        var name:String = ""
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                name = trans.value(forKey: "lastSyncUpDate") as! String
                print(name)
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return name
    }
    

    
    
    func deleteTimeTable(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "TimeTableCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}


