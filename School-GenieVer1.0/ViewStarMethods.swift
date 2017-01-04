//
//  ViewStarMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 03/01/17.
//  Copyright © 2017 Realizer. All rights reserved.
//

import Foundation
import CoreData

class ViewStarMethods{
    
    func storeStar (star: StarModels) {
        let context = getContext()
        if(star.Star != nil)
        {
            
            if(star.Star?.isEmpty)!{
                
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
            
            
            //retrieve the entity that we just created
            let entity =  NSEntityDescription.entity(forEntityName: "ViewStarCoreData", in: context)
            
            
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            
            //set the entity values
            transc.setValue(star.Comment, forKey: "comments")
            transc.setValue(star.Star, forKey: "star")
            transc.setValue(star.StarDate, forKey: "starDate")
            transc.setValue(star.Subject, forKey: "subject")
            transc.setValue(star.TeacherLoginId, forKey: "teacherPic")
            transc.setValue(star.TeacherName, forKey: "teacherName")
            transc.setValue(syncDate, forKey: "syncdate")
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
    
    
    
    // Get All Homework
    
    func getStars(subject:String) -> [StarModels]{
        
        var starList = [StarModels]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ViewStarCoreData")
        let subject1:String = subject
        let predicate = NSPredicate(format: "subject == %@", subject1)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "syncdate", ascending: false)]
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                var star = StarModels()
                //get the Key Value pairs (although there may be a better way to do that...
                var subject:String = ""
                if(trans.value(forKey: "subject") != nil){
                    subject = trans.value(forKey: "subject") as! String
                }
                var starName:String = ""
                if(trans.value(forKey: "star") != nil){
                    starName = trans.value(forKey: "star") as! String
                }
                var starDate:String = ""
                if(trans.value(forKey: "starDate") != nil){
                    starDate = trans.value(forKey: "starDate") as! String
                }
                var comments:String = ""
                if(trans.value(forKey: "comments") != nil){
                    comments = trans.value(forKey: "comments") as! String
                }
                var teacherName:String = ""
                if(trans.value(forKey: "teacherName") != nil){
                    teacherName = trans.value(forKey: "teacherName") as! String
                }
                var teacherPic:String = ""
                if(trans.value(forKey: "teacherPic") != nil){
                    teacherPic = trans.value(forKey: "teacherPic") as! String
                }
                
                star.setValue(notitype: "Star", subject: subject, stardate: starDate, comment: comments, teachername: teacherName, teacherloginid: teacherPic, star: starName)
                
                
                starList.append(star)
                
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return starList
    }
    
    func deleteStar(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ViewStarCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}

