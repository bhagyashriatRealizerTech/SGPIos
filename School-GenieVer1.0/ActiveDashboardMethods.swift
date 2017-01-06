//
//  ActiveDashboardMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 06/01/17.
//  Copyright © 2017 Realizer. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ActiveDashboardMethods{
    
    func storeActiveDashboard (activeNotif: ActiveDashboard) {
        let context = getContext()
        if(activeNotif.Title != nil)
        {
            
            if(activeNotif.Title.isEmpty){
                
            }
                
            else{
                
                let date1:Date = Date()
                let calendar = Calendar.autoupdatingCurrent
                let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date1)
                
                let currentY:Int = components.year!
                let currentM:Int = components.month!
                let currentD:Int = components.day!
                let currentH:Int = components.year!
                let currentMi:Int = components.month!
                let currentS:Int = components.day!
                
                
                
                let syncDate = String(currentY)+"/"+String(currentM)+"/"+String(currentD)+"/"+String(currentH)+"/"+String(currentMi)+"/"+String(currentS)
                
                let messageID = UUID().uuidString
                
                
                //retrieve the entity that we just created
                let entity =  NSEntityDescription.entity(forEntityName: "ActiveDashboardCoreData", in: context)
                
                
                let transc = NSManagedObject(entity: entity!, insertInto: context)
                
                
                //set the entity values
                transc.setValue(activeNotif.Title, forKey: "title")
                transc.setValue(activeNotif.Message, forKey: "msg")
                transc.setValue(syncDate, forKey: "recievedDate")
                transc.setValue(messageID, forKey: "msgId")

                //save the object
                do {
                    try context.save()
                    print("saved!")
                } catch let error as NSError  {
                    print("Could not save \(error), \(error.userInfo)")
                } catch {
                    
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadActive"), object: nil)
            }
        }
        
    }
    
    
    
    // Get All Homework
    
    func getActiveDashboard() -> [ActiveDashboard]{
        
        var activeList = [ActiveDashboard]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ActiveDashboardCoreData")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "recievedDate", ascending: false)]
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
               
                //get the Key Value pairs (although there may be a better way to do that...
                var title:String = ""
                if(trans.value(forKey: "title") != nil){
                    title = trans.value(forKey: "title") as! String
                }
                var msg:String = ""
                if(trans.value(forKey: "msg") != nil){
                    msg = trans.value(forKey: "msg") as! String
                }
                var date:String = ""
                if(trans.value(forKey: "recievedDate") != nil){
                    date = trans.value(forKey: "recievedDate") as! String
                }
                var msgId:String = ""
                if(trans.value(forKey: "msgId") != nil){
                    msgId = trans.value(forKey: "msgId") as! String
                }
                
                let active = ActiveDashboard(date: date, msg: msg, title: title, messageID: msgId)
                
                
                activeList.append(active)
                
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return activeList
    }
    
    func deleteActiveDashboard(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ActiveDashboardCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }

}
