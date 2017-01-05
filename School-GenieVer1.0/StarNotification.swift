//
//  StarNotification.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 05/01/17.
//  Copyright © 2017 Realizer. All rights reserved.
//

import Foundation

class StarNotification{
    
    func setStar(userInfo: [AnyHashable: Any]) {
        
        var starName:String = ""
        var starDate:String = ""
        var comments:String = ""
        var subject:String = ""
        var teacherName:String = ""
        var teacherId:String = ""
        
        if let star = userInfo["Star"] as? String {
            
            starName = star
        }
        if let date = userInfo["StarDate"] as? String {
            
            starDate = date
        }
        if let comment = userInfo["Comment"] as? String {
            
            comments = comment
        }
        if let sub = userInfo["Subject"] as? String {
            
            subject = sub
        }
        if let tname = userInfo["TeacherName"] as? String {
            
            teacherName = tname
        }
        if let pic = userInfo["TeacherThumbnailUrl"] as? String {
            
            teacherId = pic
        }
        
        let starinfo = StarModels()
        starinfo.setValue(notitype: "ViewStar", subject: subject, stardate: starDate, comment: comments, teachername: teacherName, teacherloginid: teacherId, star: starName)
        
        let starmethod = ViewStarMethods()
        starmethod.storeStar(star: starinfo)
        
    }
}
