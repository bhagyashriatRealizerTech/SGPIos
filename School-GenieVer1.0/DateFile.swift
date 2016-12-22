//
//  DateFile.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 21/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation

class DateFile{
    
    
    func  getDayOfWeek( day:Int)-> String {
        var dayOfWeek:String = "";
        
        switch (day) {
        case 1:
            dayOfWeek = "Sunday";
            break;
        case 2:
            dayOfWeek = "Monday";
            break;
        case 3:
            dayOfWeek = "Tuesday";
            break;
        case 4:
            dayOfWeek = "Wednesday";
            break;
        case 5:
            dayOfWeek = "Thursday";
            break;
        case 6:
            dayOfWeek = "Friday";
            break;
        case 7:
            dayOfWeek = "Saturday";
            break;
            
        default:
            break
            
        }
        
        return dayOfWeek;
    }
    
    
    func getDate(date:String , FLAG: String) ->String{
        var datetimevalue:String = ""
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        let d=dateformatter.date(from: date)
        
        
        
        
        let  dateformatter1 = DateFormatter()
        dateformatter1.dateFormat = "dd  MMM yyyy"
        //let  date1=dateformatter.date(from: date)
        var currentdate=dateformatter.string(from: Date())
        //var outdate:String!
        //var  outdate:String = date.split("")[0] as! String
        var outdate:String = dateformatter.string(from: d!)
        // var outDateinput:Date = d.parse(outdate) as! Date
        var outtime: String = ""
        
        if(date.components(separatedBy: "").count>1) {
            var time:[String] = date.components(separatedBy: "")[0].components(separatedBy: ":")
            
            
            // var t1:Int = Int.valueOf(time[0]);
            var tp:String = ""
            var t1:Int!
            
            if (t1==12)
            {
                tp = "PM";
                outtime = String(t1) + ":" + time[1] + " " + tp;
            }
            else if (t1 > 12) {
                var t2:Int = t1 - 12;
                tp = "PM";
                outtime = String(t2) + ":" + time[1] + " " + tp;
            } else {
                tp = "AM";
                outtime = time[0] + ":" + time[1] + " " + tp;
            }
        }
        
        if (FLAG=="D" || FLAG=="DT") {
            
            //Current Date Message
            if (outdate == currentdate) {
                datetimevalue = "Today"
                
            } else {
                var cal=NSCalendar.current
                let oneDayAgo = cal.date(byAdding: .day, value: -1, to: Date())
                let d1 = dateformatter.string(from: oneDayAgo!)
                // cal.add(Calendar.DATE, -1);
                
                //Yesterdays Message
                if (outdate == d1) {
                    datetimevalue = "Yesterday";
                    
                } else {
                    var twodaysAgo = cal.date(byAdding: .day, value: -2, to: Date())
                    var daysago = dateformatter.string(from: twodaysAgo!)
                    
                    
                    // cal.add(Calendar.DATE, -1);
                    
                    
                    var count = -3
                    for i in 0...5
                    {
                        if (outdate == daysago) {
                            var day:Int = cal.component(.weekday, from: twodaysAgo!)
                            datetimevalue = getDayOfWeek(day: day)
                            break
                        }
                        else{
                            if (i == 4) {
                                datetimevalue = dateformatter1.string(from: d!)
                                
                                
                            } else
                            {
                                twodaysAgo = cal.date(byAdding: .day, value: count, to: Date())
                                daysago = dateformatter.string(from: twodaysAgo!)
                                count  = count-1
                            }
                        }
                        
                    }
                }
                
                /* if (FLAG == "DT")
                 {
                 var  datetimevalue = datetimevalue + " " + outtime
                 }
                 else {
                 if(FLAG == "T"){
                 datetimevalue = outtime
                 }
                 
                 }        }*/
                
            }
        }
        return datetimevalue;
    }

}
