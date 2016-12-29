//
//  ClassworkAPI.swift
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

class ClassworkAPI{
    
    let cwmethod = ClassworkMethods()
    var subjects = [String]()
    var ipdate:String = ""
    var subject = String()
    
    
    func downloadClasswork(completed: DownloadComplete){
        
        //cwmethod.deleteClasswork()
        
        let tempdate = cwmethod.getLastClassworkDate()
       // let tempdate = "2016/12/15"
        var datestr = String()
        print(datestr)
        
        
        let suballocation = SubjectAllocationMethods()
        subjects = suballocation.getAllSubjects()
        
        
        let date1:Date = Date()
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date1)
        
        let currentY:Int = components.year!
        let currentM:Int = components.month!
        let currentD:Int = components.day!
        
        ipdate = String(currentM)+"/"+String(currentD)+"/"+String(currentY)
        
        
        
        if(tempdate.isEmpty)
        {
            //var index = 0
            
            for index in 0...(subjects.count-1)
            {
                subject = subjects[index]
                downloadforAllSubDates(completed: {}, date: ipdate, subject: subject)
                
            }
        }
        else{
            let dateArr1:[String] = tempdate.components(separatedBy: "/")
            ipdate = dateArr1[1]+"/"+dateArr1[2]+"/"+dateArr1[0]
            datestr = ipdate

            let datearr:[String] = datestr.components(separatedBy: "/")
            var prevD:Int = Int(datearr[1])!
            let prevM:Int = Int(datearr[0])!
            let prevY:Int = Int(datearr[2])!
            
            let yeardiff = currentY - prevY
            let monthdiff = currentM - prevM
            let daydiff = currentD - prevD
            
            if(yeardiff == 0)
            {
                if(monthdiff == 0)
                {
                    if(daydiff == 0){
                        
                        currentdayClasswork(currentDate: ipdate)
                    }
                    else if(daydiff > 0){
                        
                        currentdayClasswork(currentDate: ipdate)
                        
                        for index in 1...daydiff{
                            
                            let newDate:Int = prevD + (1)
                            prevD = newDate
                            
                            ipdate = String(prevM)+"/"+String(newDate)+"/"+String(prevY)
                            
                            for index1 in 0...(subjects.count - 1){
                                subject = subjects[index1]
                                
                                downloadforAllSubDates(completed: {}, date: ipdate, subject: subject)
                                
                            }
                            
                            
                        }
                    }
                    
                }
                else if(monthdiff > 0){
                    
                    var month:Int = prevM
                    var day:Int = prevD + 1
                    
                    
                    currentdayClasswork(currentDate: ipdate)
                    
                    for indexout in 0...monthdiff{
                        
                        getClassworkForMonth(day: day, month: month, year: prevY)
                        month = month + 1
                        day = 1
                        
                    }
                    
                    
                }
            }
            else{
                
                var month:Int = prevM
                var day:Int = prevD + 1
                var year:Int = prevY
                
                currentdayClasswork(currentDate: ipdate)
                
                for indexY in 0...yeardiff{
                    
                    for indexM in 1...12{
                        if(month > 12)
                        {
                            year = year + 1
                            month = 1
                            day = 1
                            break
                        }
                        else{
                            
                            getClassworkForMonth(day: prevD, month: month, year: prevY)
                            month = month + 1
                            day = 1
                            
                        }
                    }
                    
                }
                
                
            }
            
        }
        
        
        completed()
    }
    
    
    func getNumberOfaysInMonthYear(tempMonth:Int , tempYear:Int) -> Int {
        
        var numDays = 0;
        
        let dateComponents = DateComponents(year: tempYear, month: tempMonth)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        numDays = range.count
        
        print(numDays)
        
        return numDays
        
    }
    
    
    func downloadforAllSubDates(completed: DownloadComplete, date:String, subject:String){
        
        let methodName = "fetchClassWork"
        Current_Url = "\(BASE_URL)\(methodName)"
        let current_url = URL(string: Current_Url)!
        
        
        let userid:String = UserDefaults.standard.value(forKey: "UserId") as! String
        let deviceid:String = UserDefaults.standard.value(forKey: "DeviceId") as! String
        let accesstoken:String = UserDefaults.standard.value(forKey: "Accesstoken") as! String
        let schoolcode:String = UserDefaults.standard.value(forKey: "SchoolCode") as! String
        let std:String = UserDefaults.standard.value(forKey: "Std") as! String
        let div:String = UserDefaults.standard.value(forKey: "Div") as! String
        
        let headers1:HTTPHeaders = ["AccessToken":accesstoken,
                                    "Content-Type": "application/json",
                                    "Accept": "application/json"]
        
        let parameters1 = ["std": std,"cwDate":date,"schoolCode":schoolcode,"division":div,
                           "subject":subject,"UserId":userid,"DeviceId":deviceid]
        
        
        print(current_url)
        
        Alamofire.request(current_url, method: .post, parameters: parameters1, encoding: JSONEncoding.default, headers: headers1).responseJSON{ response in
            
            
            let result = response.result
            
            print(result.value)
            
            if let dict = result.value as? Dictionary<String, AnyObject>
            {
                
                if let classworkresult = dict["fetchClassWorkResult"] as? Dictionary<String, AnyObject>
                {
                    
                    let res = Mapper<ClassworkModel>().map(JSONObject: classworkresult)
                    
                    if(res != nil)
                    {
                        print((res?.cwImage64Lst?.count)!)
                        
                    self.cwmethod.storeClasswork(classwork: res!)
                        
                    }
                    
                }
            }
            
        }
        
        completed()
    }
    
    
    
    func currentdayClasswork(currentDate:String){
        
        let subarr:[String] = cwmethod.getClassworkSubjectForDate(date: currentDate)
        
        if(subarr.count < subjects.count && subarr.count > 0){
            var tempsubArr = [String]()
            var counter:Int = 0;
            
            for subtemp in subjects
            {
                counter = counter+1
                for temp in subarr{
                    if(subtemp == temp)
                    {
                        break
                    }
                    else{
                        if(counter == subjects.count)
                        {
                            tempsubArr.append(subtemp)
                        }
                    }
                }
            }
            
            if(tempsubArr.count > 0)
            {
                for index in 0...tempsubArr.count{
                    
                    subject = tempsubArr[index]
                    
                    downloadforAllSubDates(completed: {}, date: currentDate, subject: subject)
                }
            }
            
        }else if(subarr.count == subjects.count){
            
        }
        else if(subarr.count == 0){
            print(subjects.count)
            
            for index1 in 0...(subjects.count - 1){
                subject = subjects[index1]
                // print(subarr)
                
                downloadforAllSubDates(completed: {}, date: ipdate, subject: subject)
                
            }
        }
        
    }
    
    
    func getClassworkForMonth(day:Int , month:Int , year:Int)
    {
        let numOfdays = getNumberOfaysInMonthYear(tempMonth: month, tempYear: year)
        
        var dayTemp:Int = day
        
        for dadyIndex in 1...numOfdays{
            if(dayTemp > numOfdays)
            {
                // month = month + 1
                break
            }
            else
            {
                
                ipdate = String(month)+"/"+String(dayTemp)+"/"+String(year)
                
                for index1 in 0...(subjects.count - 1){
                    subject = subjects[index1]
                    
                    downloadforAllSubDates(completed: {}, date: ipdate, subject: subject)
                    
                }
                
                
            }
            
            dayTemp = dayTemp + 1
        }
    }

}





