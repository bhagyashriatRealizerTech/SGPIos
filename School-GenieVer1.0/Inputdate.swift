//
//  Inputdate.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 02/01/17.
//  Copyright © 2017 Realizer. All rights reserved.
//

import Foundation

class Inputdate{
    
    func getInputDate(currentM:Int ,currentD:Int,currentY:Int ) -> String {
        var ipdate:String = String(currentM)+"/"+String(currentD)+"/"+String(currentY)
        
        if(currentM == 1 || currentM == 2 || currentM == 3 || currentM == 4 || currentM == 5 || currentM == 6 || currentM == 7 || currentM == 8 || currentM == 9)
        {
            if(currentD == 1 || currentD == 2 || currentD == 3 || currentD == 4 || currentD == 5 || currentD == 6 || currentD == 7 || currentD == 8 || currentD == 9)
            {
                ipdate = "0"+String(currentM)+"/"+"0"+String(currentD)+"/"+String(currentY)
                
            }
            else{
                ipdate = "0"+String(currentM)+"/"+String(currentD)+"/"+String(currentY)
                
            }
        }
        else if(currentD == 1 || currentD == 2 || currentD == 3 || currentD == 4 || currentD == 5 || currentD == 6 || currentD == 7 || currentD == 8 || currentD == 9)
        {
            
            ipdate = String(currentM)+"/"+"0"+String(currentD)+"/"+String(currentY)
            
        }
        else{
            ipdate = String(currentM)+"/"+"0"+String(currentD)+"/"+String(currentY)
        }
        return ipdate
    }
    
    func getAcademicYear() -> String {
        
        var academicY = String()
        let date1:Date = Date()
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date1)
        
        let currentY:Int = components.year!
        let currentM:Int = components.month!
        
        academicY = String(currentY)
        
        if(currentM <= 4){
            var prevY = Int()
            prevY = currentY - 1
            academicY = String(prevY)
        }
        
        return academicY
    }
}
