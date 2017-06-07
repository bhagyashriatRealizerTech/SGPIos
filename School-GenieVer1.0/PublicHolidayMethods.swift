//
//  PublicHolidayMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 14/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class PublicHolidayMethods{
    
    func storePublicHoliday (publicholiday: [PublicHoliday]) {
        let context = getContext()
        
        deletePublicHoliday()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "PublicHolidayCoreData", in: context)
        
        for pbobj in publicholiday as [PublicHoliday]
        {
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            //set the entity values
            transc.setValue(pbobj.CreatedBy, forKey: "createdBy")
            transc.setValue(pbobj.Holiday, forKey: "holiday")
            transc.setValue(pbobj.PHEndDate, forKey: "phEndDate")
            transc.setValue(pbobj.PHStartDate, forKey: "phStartDate")
            
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
    
    
    func getPublicHoliday() -> [PublicHoliday] {
        
        var holdayList = [PublicHoliday]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "PublicHolidayCoreData")
        //let fetchRequest: NSFetchRequest<PupilInformation> = PupilInformation.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                var holidayObj = PublicHoliday()
                var holiday:String = ""
                if(trans.value(forKey: "holiday") != nil){
                    holiday = trans.value(forKey: "holiday")as! String
                }
                
                var created:String = ""
                if(trans.value(forKey: "createdBy") != nil){
                    created = trans.value(forKey: "createdBy")as! String
                }
                
                var enddate:String = ""
                if(trans.value(forKey: "phEndDate") != nil){
                    enddate = trans.value(forKey: "phEndDate")as! String
                }
                
                var startdate:String = ""
                if(trans.value(forKey: "phStartDate") != nil){
                    startdate = trans.value(forKey: "phStartDate")as! String
                }
                
                holidayObj.setUpValue(createdby: created, holiday: holiday, enddate: enddate, startDate: startdate)
                
                holdayList.append(holidayObj)
                //print(name)
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return holdayList
    }
    
    
    func deletePublicHoliday(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "PublicHolidayCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
    
}
