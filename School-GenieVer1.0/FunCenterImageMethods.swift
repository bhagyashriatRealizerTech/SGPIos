//
//  FunCenterImageMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class FunCenterImageMethods{
    
    func storeFunCenterEventImage (images: [FunCenterImageModel]) {
        let context = getContext()
        
        //deleteFunCenterEventImage()
        
        if(images.count == 0)
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
            let entity =  NSEntityDescription.entity(forEntityName: "FunCenterImageCoreData", in: context)
            
            for image in images as [FunCenterImageModel]
            {
                
                var title:String = "Fun Center Image"
                var message:String = "Downloaded Fun Center Image"
                let alert = ActiveDashboard(date: "", msg: message, title: title, messageID: "")
                
                let alertmethod = ActiveDashboardMethods()
                alertmethod.storeActiveDashboard(activeNotif: alert)
                
                
                let imId = getLastFunCenterImageById(imageId: image.ImageId!)
                if(imId.isEmpty){
                let transc = NSManagedObject(entity: entity!, insertInto: context)
                
                //set the entity values
                transc.setValue(image.CreateTime, forKey: "createTime")
                transc.setValue(image.EventId, forKey: "eventId")
                transc.setValue(image.ImageCaption, forKey: "imageCaption")
                transc.setValue(image.ImageId, forKey: "imageId")
                transc.setValue(image.SrNo, forKey: "srNo")
                transc.setValue(image.fileName, forKey: "fileName")
                transc.setValue(image.uploadDate, forKey: "uploadDate")
                transc.setValue(syncDate, forKey: "lastSyncDateFi")
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
    
    
    func getFunCenterEventImage(eventId:String) -> [FunCenterImageModel] {
        var imageList = [FunCenterImageModel]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FunCenterImageCoreData")
        let predicate = NSPredicate(format: "eventId == %@", eventId)
        fetchRequest.predicate = predicate
        //let fetchRequest: NSFetchRequest<PupilInformation> = PupilInformation.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                let images = FunCenterImageModel()
                //get the Key Value pairs (although there may be a better way to do that...
                var srno = 0
                var temp = trans.value(forKey: "srNo")
                if(temp != nil){
                    srno = temp as! Int
                }
                
                var eventid = ""
                temp = trans.value(forKey: "eventId")
                if(temp != nil){
                    eventid = temp as! String
                }
                
                var imageC = ""
                temp = trans.value(forKey: "imageCaption")
                if(temp != nil){
                    imageC = temp as! String
                }
                
                var uploadD = ""
                temp = trans.value(forKey: "uploadDate")
                if(temp != nil){
                    uploadD = temp as! String
                }
                
                var fileN = ""
                temp = trans.value(forKey: "fileName")
                if(temp != nil){
                    fileN = temp as! String
                }
                
                var creatT = ""
                temp = trans.value(forKey: "createTime")
                if(temp != nil){
                    creatT = temp as! String
                }
                
                var imageI = ""
                temp = trans.value(forKey: "imageId")
                if(temp != nil){
                    imageI = temp as! String
                }


                images.setImages(createTime: creatT, imageCaption: imageC, uploaddate: uploadD, imageId: imageI, srNo: srno, filename: fileN, eventId: eventid)
                
                imageList.append(images)
                
                
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        return imageList
    }
    
    //Get Last Date
    
    func getLastFunCenterEventImageDate() ->String {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FunCenterImageCoreData")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastSyncDateFi", ascending: false)]
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
                name = trans.value(forKey: "lastSyncDateFi") as! String
                print(name)
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return name
    }
    
    
    func getLastFunCenterImageById(imageId:String) ->String {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FunCenterImageCoreData")
        
        var name:String = ""
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                name = trans.value(forKey: "imageId") as! String
                print(name)
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return name
    }

    
    

    
    
    func deleteFunCenterEventImage(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FunCenterImageCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}



