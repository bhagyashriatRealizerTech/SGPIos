//
//  ChatInitiateMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 23/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import CoreData

class ChatInitiateMethods{
    func storeThread (chatObj: LastMsgDtls) {
        let context = getContext()
        
        deleteAnnouncement()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "InitiateThread", in: context)
        
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        transc.setValue(chatObj.LastmessageSenderId, forKey: "lastmsgSenderId")
        transc.setValue(chatObj.LastmsgSenderimage, forKey: "lstmsgSenderpic")
        transc.setValue(chatObj.LastMsgSender, forKey: "lastmsgSenderName")
        transc.setValue(chatObj.ThreadId, forKey: "threadId")
        transc.setValue(chatObj.ThreadName, forKey: "threadName")
        transc.setValue(chatObj.LastMsgTime, forKey: "lastmsgTime")
        transc.setValue(chatObj.Lastmsgtext, forKey: "lastmsgText")
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        
        
        
    }
    
    
    func getThreadList() -> [LastMsgDtls] {
        
        var messageArr = [LastMsgDtls]()
        //create a fetch request, telling it about the entity
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "InitiateThread")
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                var msg = LastMsgDtls()
                
                var senderid:String = ""
                if(trans.value(forKey: "lastmsgSenderId") != nil){
                    senderid = trans.value(forKey: "lastmsgSenderId") as! String
                }
                var senderpic:String = ""
                if(trans.value(forKey: "lstmsgSenderpic") != nil){
                    senderpic = trans.value(forKey: "lstmsgSenderpic") as! String
                }
                var sendername:String = ""
                if(trans.value(forKey: "lastmsgSenderName") != nil){
                    sendername = trans.value(forKey: "lastmsgSenderName") as! String
                }
                
                var threadid:String = ""
                if(trans.value(forKey: "threadId") != nil){
                    threadid = trans.value(forKey: "threadId") as! String
                }
                
                var threadname:String = ""
                if(trans.value(forKey: "threadName") != nil){
                    threadname = trans.value(forKey: "threadName") as! String
                }
                
                var msgtime:String = ""
                if(trans.value(forKey: "lastmsgTime") != nil){
                    msgtime = trans.value(forKey: "lastmsgTime") as! String
                }
                
                var msgtxt:String = ""
                if(trans.value(forKey: "lastmsgText") != nil){
                    msgtxt = trans.value(forKey: "lastmsgText") as! String
                }
                
                msg = LastMsgDtls(LastMsgSender: sendername, Lastmsgtext: msgtxt, LastMsgTime: msgtime, LastmsgSenderimage: senderpic, LastMessageSenderID: senderid, ThraedID: threadid, ThreadName: threadname)

                messageArr.append(msg)
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        return messageArr
    }
    
    
    func deleteAnnouncement(){
        // Create Fetch Request
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "InitiateThread")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try getContext().execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}
