//
//  TimeTableAPI.swift
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

class TimeTableAPI{
    
    let timetablemethod = TimeTableMethods()
    
    func downloadTimeTable(completed: DownloadComplete){
        
        //timetablemethod.deleteTimeTable()
    
        let datetime = timetablemethod.getLastTimeTableDate()
       // let datetime = "2016/12/15"
        var ipdate = String()
        
        
        
        if(datetime.isEmpty)
        {
        let date1:Date = Date()
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date1)
        
        let currentY:Int = components.year!
        let currentM:Int = components.month!
        let currentD:Int = components.day!
        
        ipdate = String(currentM)+"/"+String(currentD)+"/"+String(currentY)
            
        }
        else{
            
            let dateArr1:[String] = datetime.components(separatedBy: "/")
            ipdate = dateArr1[1]+"/"+dateArr1[2]+"/"+dateArr1[0]

        }
        
        let methodName = "FetchTimeTables"
        Current_Url = "\(BASE_URL)\(methodName)"
        print(Current_Url)

        let current_url = URL(string: Current_Url)!
        
        
        
        let accesstoken:String = UserDefaults.standard.value(forKey: "Accesstoken") as! String
        let schoolcode:String = UserDefaults.standard.value(forKey: "SchoolCode") as! String
        let std:String = UserDefaults.standard.value(forKey: "Std") as! String
        let div:String = UserDefaults.standard.value(forKey: "Div") as! String
        let academicyear:String = UserDefaults.standard.value(forKey: "AcademicYear") as! String
        
        let parameters1 = ["SchoolCode":schoolcode,"AcademicYear":academicyear,"Std":std,"Div":div, "FromDate":ipdate]
        
        
        let headers1:HTTPHeaders = ["AccessToken":accesstoken,
                                    "Content-Type": "application/json",
                                    "Accept": "application/json"]
        
        print(current_url)
        
        Alamofire.request(current_url, method: .post, parameters: parameters1, encoding: JSONEncoding.default, headers: headers1).responseJSON{ response in
            
            
            let result = response.result
            
            print(result.value)
            
            if let dict = result.value as? Dictionary<String, AnyObject>
            {
                
                let res = Mapper<TTList>().map(JSONObject: dict)
                if(res != nil){
                    
                //TODO Insert Value in Database
                   
                    self.timetablemethod.storeTimeTable(timetables: (res?.TTLst)!)
                }
                
            }
            
        }
        
        completed()
    }
    
    
}
