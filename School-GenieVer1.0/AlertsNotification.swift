//
//  AlertsNotification.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 05/01/17.
//  Copyright © 2017 Realizer. All rights reserved.
//

import Foundation

class AlertsNotification{
    
    func setAlert(userInfo: [AnyHashable: Any]){
        
        var alertText:String = ""
        var createTs:String = ""
        var categoryname:String = ""
        var initial:String = ""
        var sendername:String = ""
        
        if let alert = userInfo["AnnouncementText"] as? String {
            
            alertText = alert
        }
        if let date = userInfo["SendTime"] as? String {
            
            createTs = date
        }
        if let catname = userInfo["Category"] as? String {
            
            categoryname = catname
        }
        if let sender = userInfo["SentBy"] as? String {
            
            sendername = sender
        }
        
        let alertmodel = Alerts(category: categoryname, msgText: alertText, attachmentExists: false, attachimage: sendername, aldate: createTs, initial: "")
        
        let alertMethod = AnnouncementMethods()
        alertMethod.storeSinglAnnouncement(annobj: alertmodel)
        
        
    }
}
