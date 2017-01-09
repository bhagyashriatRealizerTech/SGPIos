//
//  AnnouncementMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class AnnouncementMethods{
    
    func storeAnnouncement (announcements: [AnnouncementModel]) {
        let context = getContext()
        
        deleteAnnouncement()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "AnnouncementCoreData", in: context)
        
        for annobj in announcements as [AnnouncementModel]
        {
            
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            //set the entity values
            transc.setValue(annobj.SchoolCode, forKey: "schoolCode")
            transc.setValue(annobj.AnnouncementId, forKey: "announcementId")
            transc.setValue(annobj.Std, forKey: "std")
            transc.setValue(annobj.division, forKey: "division")
            transc.setValue(annobj.AcademicYr, forKey: "academicYr")
            transc.setValue(annobj.AnnouncementText, forKey: "announcementText")
            transc.setValue(annobj.Category, forKey: "category")
            transc.setValue(annobj.sentBy, forKey: "sentBy")
            transc.setValue(annobj.createTS, forKey: "createTS")
            
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
    
    func storeSinglAnnouncement (annobj: Alerts) {
        let context = getContext()
        
        //deleteAnnouncement()
        
        let title:String = "Alert"
        let message:String = "Recieved alert for "+annobj.category+": "+annobj.msgText
        
        let alert = ActiveDashboard(date: "", msg: message, title: title, messageID: "")
        
        let alertmethod = ActiveDashboardMethods()
        alertmethod.storeActiveDashboard(activeNotif: alert)
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "AnnouncementCoreData", in: context)
        
        
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            //set the entity values
            transc.setValue("", forKey: "schoolCode")
            transc.setValue("", forKey: "announcementId")
            transc.setValue("", forKey: "std")
            transc.setValue("", forKey: "division")
            transc.setValue("", forKey: "academicYr")
            transc.setValue(annobj.msgText, forKey: "announcementText")
            transc.setValue(annobj.category, forKey: "category")
            transc.setValue(annobj.attachimage, forKey: "sentBy")
            transc.setValue(annobj.aldate, forKey: "createTS")
            
            //save the object
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
        
        
    }
    

    
    func getAnnouncement() -> [Alerts] {
        
        var alertArr = [Alerts]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "AnnouncementCoreData")
        //let fetchRequest: NSFetchRequest<PupilInformation> = PupilInformation.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                
                var anntext:String = ""
                if(trans.value(forKey: "announcementText") != nil){
                anntext = trans.value(forKey: "announcementText") as! String
                }
                var ancategory:String = ""
                if(trans.value(forKey: "category") != nil){
                ancategory = trans.value(forKey: "category") as! String
                }
                var anndate:String = ""
                if(trans.value(forKey: "createTS") != nil){
                anndate = trans.value(forKey: "createTS") as! String
                }
                
                let alert = Alerts(category: ancategory, msgText: anntext, attachmentExists: false, attachimage: ancategory, aldate: anndate, initial: ancategory)
                alertArr.append(alert)
                print(anntext)
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return alertArr
    }
    
    
    func deleteAnnouncement(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "AnnouncementCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}
