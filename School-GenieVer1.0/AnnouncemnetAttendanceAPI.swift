//
//  AnnouncemnetAttendanceAPI.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import ObjectMapper
import CoreData

class AnnouncemnetAttendanceAPI{
    
    
    func downloadAnnouncementAttendance(completed: DownloadComplete){
        
        let methodName = "StudentSyncUp/"
        var uname:String = (UserDefaults.standard.value(forKey: "UserId") as! String )
        uname = uname + "/"
        let Schoolcode:String = UserDefaults.standard.value(forKey: "SchoolCode") as! String + "/"
        let Std:String = UserDefaults.standard.value(forKey: "Std") as! String + "/"
        let Div:String = UserDefaults.standard.value(forKey: "Div") as! String + "/"
        var academicyr:String = UserDefaults.standard.value(forKey: "AcademicYear") as! String
        academicyr = academicyr + "/"
        
        let date1:Date = Date()
        let dateformatter = DateFormatter()
        dateformatter.timeZone = TimeZone(abbreviation: "UTC")
        let tempdate:String = dateformatter.string(from: date1)
        let ipdate:Date = dateformatter.date(from: tempdate)!
        
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: ipdate)
        
        let y = components.year!
        let urlSeparator = "/"
        let year:String = "\(y)\(urlSeparator)"
        
        let m = components.month!
        let month:String = "\(m)\(urlSeparator)"
        
        let d = components.day!
        let date:String = "\(d)\(urlSeparator)"
        
        let h = components.hour!
        let hour:String = "\(h)\(urlSeparator)"
        
        let mn = components.minute!
        let min:String = "\(mn)\(urlSeparator)"
        
        let sc = components.second!
        let sec:String = "\(sc)"
        
        Current_Url = "\(BASE_URL)\(methodName)\(uname)\(Schoolcode)\(Std)\(Div)\(academicyr)\(year)\(month)\(date)\(hour)\(min)\(sec)"
        
        let current_url = URL(string: Current_Url)!
        
        print(current_url)
        
        Alamofire.request(current_url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON{ response in
            
            
            let result = response.result
            
           // print(result.value)
            
            if let dict = result.value as? Dictionary<String, AnyObject>
            {
                
                let res = Mapper<SyncUpList>().map(JSONObject: dict)
                print((res?.annLst?.count)!)
                //TODO Insert Value in Database
                
                
                if(res?.annLst != nil){
                    let announcmnt = AnnouncementMethods()
                    announcmnt.storeAnnouncement(announcements: (res?.annLst)!)
                }
                
                if(res?.attLst != nil)
                {
                    let attendnc = AttendaceMethods()
                    attendnc.storeAttendace(attendace: (res?.attLst)!)
                }
                
            }
            
            
        }
        
        completed()
        
        
    }
    
    
}
