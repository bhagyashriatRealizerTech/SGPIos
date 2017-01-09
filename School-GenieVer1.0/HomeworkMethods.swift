//
//  HomeworkMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class HomeworkMethods{
    
    func storeHomework (homework: HomeworkModel) {
        let context = getContext()
        if(homework.hwImage64Lst?.count == 0 && homework.hwTxtLst?.count == 0)
        {
            
        }
        else{
            let title:String = "Homework"
            let message:String = "Downloaded Homework for "+homework.subject!
            
            let alert = ActiveDashboard(date: "", msg: message, title: title, messageID: "")
            
            let alertmethod = ActiveDashboardMethods()
            alertmethod.storeActiveDashboard(activeNotif: alert)
            
            let date1:Date = Date()
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date1)
            
            let currentY:Int = components.year!
            let currentM:Int = components.month!
            let currentD:Int = components.day!
            
            let syncDate = String(currentY)+"/"+String(currentM)+"/"+String(currentD)
            
            
            //retrieve the entity that we just created
            let entity =  NSEntityDescription.entity(forEntityName: "HomeworkCoreData", in: context)
            
            
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            
            //set the entity values
            transc.setValue(homework.SchoolCode, forKey: "schoolCode")
            transc.setValue(homework.hwDate, forKey: "hwDate")
            transc.setValue(homework.Std, forKey: "std")
            transc.setValue(homework.div, forKey: "div")
            transc.setValue(homework.subject, forKey: "subject")
            transc.setValue(homework.hwTxtLst?.joined(separator: "@@@"), forKey: "hwTxtLst")
            transc.setValue(homework.hwImage64Lst?.joined(separator: "@@@"), forKey: "hwImage64Lst")
            transc.setValue(homework.givenBy, forKey: "givenBy")
            transc.setValue(syncDate, forKey: "lastSyncDateHw")
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
    
    
    
    // Get All Homework
    
    func getHomework(date:String) -> [HomeWork]{
        
        var homeworkList = [HomeWork]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "HomeworkCoreData")
        let date1:String = date
        let predicate = NSPredicate(format: "hwDate == %@", date1)
        fetchRequest.predicate = predicate
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                var homework = HomeWork()
                //get the Key Value pairs (although there may be a better way to do that...
                var subject:String = ""
                if(trans.value(forKey: "subject") != nil){
                    subject = trans.value(forKey: "subject") as! String
                }
                var hwDate:String = ""
                if(trans.value(forKey: "hwDate") != nil){
                    hwDate = trans.value(forKey: "hwDate") as! String
                }
                var hwText:String = ""
                if(trans.value(forKey: "hwTxtLst") != nil){
                    hwText = trans.value(forKey: "hwTxtLst") as! String
                }
                var hwImage:String = ""
                if(trans.value(forKey: "hwImage64Lst") != nil){
                    hwImage = trans.value(forKey: "hwImage64Lst") as! String
                }
                var givenBy:String = ""
                if(trans.value(forKey: "givenBy") != nil){
                    givenBy = trans.value(forKey: "givenBy") as! String
                }
                
                
                if(hwImage.isEmpty)
                {
                    homework = HomeWork(subject: subject, subjectText: hwText, attachmentExists: false, attachimage: "", givenby: givenBy,hwDate: hwDate)
                }
                else{
                    homework = HomeWork(subject: subject, subjectText: hwText, attachmentExists: true, attachimage: hwImage, givenby: givenBy,hwDate: hwDate)
                }
                
                
                homeworkList.append(homework)
                
                //print("\(trans.value(forKey: "fName"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return homeworkList
    }
    
    
    //Get Last Date
    
    func getLastHomeworkDate() ->String {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "HomeworkCoreData")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastSyncDateHw", ascending: false)]
        fetchRequest.fetchLimit = 1
        var date:String = ""
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                if(trans.value(forKey: "lastSyncDateHw") != nil){
                    date = trans.value(forKey: "lastSyncDateHw") as! String
                }
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return date
    }
    
    func getallLastHomeworkDate() ->[String] {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "HomeworkCoreData")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastSyncDateHw", ascending: false)]
        var date:String = ""
        var date1:[String]=[]
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                if(trans.value(forKey: "hwDate") != nil){
                    date = trans.value(forKey: "hwDate") as! String
                    
                    
               /* let dtfm=DateFormatter()
                dtfm.dateFormat = "MM-dd-yyyy"
                print(dtfm.date(from: date))*/
                    
                    
                    /*let strTime = "2015-07-27 19:29:50 +0000"
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
                    formatter.date(from: strTime)                    //var d1 = d as String
                    print(formatter.date(from: strTime) )*/
                    
                    date1.append(date)
                }
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return date1
    }

    
    func getSubjectForDate(date:String) ->[String] {
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "HomeworkCoreData")
        let date1:String = date
        let predicate = NSPredicate(format: "hwDate == %@", date1)
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
    
    
    
    
    
    func deleteHomework(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "HomeworkCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}

