//
//  ChatMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 22/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class ChatMethods{
    
    func storeMessage (chatObj: ConversationModel) {
        let context = getContext()
        
    
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "ChatCoreData", in: context)
        
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            //set the entity values
            transc.setValue(chatObj.ConversationId, forKey: "messageId")
            transc.setValue(chatObj.sentTime, forKey: "messageTime")
            transc.setValue(chatObj.fromTeacher, forKey: "fromTeacher")
            transc.setValue(chatObj.from, forKey: "fromId")
            transc.setValue(chatObj.to, forKey: "toId")
            transc.setValue(chatObj.text, forKey: "messageText")
            transc.setValue(chatObj.profileUrl, forKey: "profileUrl")
        
            
            //save the object
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
        
        
    }
    
    
    func getMessages(userid:String) -> [ConversationModel] {
        
        var messageArr = [ConversationModel]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ChatCoreData")
       // let predicatefrom = NSPredicate(format: "fromId == %@", userid)
       // let predicateto = NSPredicate(format: "fromId == %@", userid)
        //let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [predicateto,predicatefrom])
       // fetchRequest.predicate = predicate
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                var msg = ConversationModel()
                
                var msgtext:String = ""
                if(trans.value(forKey: "messageText") != nil){
                msgtext = trans.value(forKey: "messageText") as! String
                }
                var fromId:String = ""
                 if(trans.value(forKey: "fromId") != nil){
                fromId = trans.value(forKey: "fromId") as! String
                }
                var toId:String = ""
                 if(trans.value(forKey: "toId") != nil){
                toId = trans.value(forKey: "toId") as! String
                }
                
                var msgtime:String = ""
                if(trans.value(forKey: "messageTime") != nil){
                    msgtime = trans.value(forKey: "messageTime") as! String
                }
                
                var pic:String = ""
                if(trans.value(forKey: "profileUrl") != nil){
                    pic = trans.value(forKey: "profileUrl") as! String
                }
                
                messageArr.append(msg)
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return messageArr
    }
    
    
    func deleteAnnouncement(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ChatCoreData")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}
