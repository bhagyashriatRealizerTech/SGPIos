//
//  FunCenterEventMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class FunCenterEventMethods{
    
    func storeFunCenterEvent (events: [FunCenterEventModel]) {
        let context = getContext()
        
      // deleteFunCenterEvent()
        
        if(events.count == 0)
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
            let entity =  NSEntityDescription.entity(forEntityName: "FunCenterEventCoreData", in: context)
            
            for event in events as [FunCenterEventModel]
            {
                let eid:String = getLastFunCenterEventById(event: event.EventId!)

                if(eid.isEmpty){
                let transc = NSManagedObject(entity: entity!, insertInto: context)
                                //set the entity values
                transc.setValue(event.CreateTS, forKey: "createTS")
                transc.setValue(event.Event, forKey: "event")
                transc.setValue(event.EventDate, forKey: "eventDate")
                transc.setValue(event.EventId, forKey: "eventId")
                transc.setValue(event.ThumbNailImage, forKey: "thumbNailImage")
                transc.setValue(event.ThumbNailPath, forKey: "thumbNailPath")
                transc.setValue(syncDate, forKey: "lastSyncDateFe")
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
        
    }
    
    
    func getFunCenterEvent() -> [FunCenterEventModel]{
        
        var eventlist = [FunCenterEventModel]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FunCenterEventCoreData")
        //let fetchRequest: NSFetchRequest<PupilInformation> = PupilInformation.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                let event1 = FunCenterEventModel()
                
                var image:String = ""
                var temp = trans.value(forKey: "thumbNailImage")
                if(temp != nil){
                image = temp as! String
                }
                
                var path:String = ""
                    temp = trans.value(forKey: "thumbNailPath")
                if(temp != nil){
                    path = temp as! String
                }
                var event:String = ""
                 temp = trans.value(forKey: "event")
                if(temp != nil){
                    event = temp as! String
                }
                var eventdate:String = ""
                    temp = trans.value(forKey: "eventDate")
                if(temp != nil){
                    eventdate = temp as! String
                }
                
                var creats:String = ""
                    temp = trans.value(forKey: "createTS")
                if(temp != nil){
                    creats = temp as! String
                }
                var evntId:String = ""
                temp = trans.value(forKey: "eventId")
                if(temp != nil){
                    evntId = temp as! String
                }

                print(image)
                event1.setEvents(createTs: creats, event: event, eventdate: eventdate, eventId: evntId, thumbnailImage: image, thumbnailPath: path)
                eventlist.append(event1)
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        return eventlist
    }
    
    //Get Last Date
    
    func getLastFunCenterEventDate() ->String {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FunCenterEventCoreData")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastSyncDateFe", ascending: false)]
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
                if(trans.value(forKey: "eventId") != nil){
                name = trans.value(forKey: "eventId") as! String
                print(name)
                }
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return name
    }
    
    
    
    func getLastFunCenterEventById(event:String) ->String {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FunCenterEventCoreData")
    
        var name:String = ""
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                name = trans.value(forKey: "lastSyncDateFe") as! String
                print(name)
                
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return name
    }
    
    
    func deleteFunCenterEvent(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FunCenterEventCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}



