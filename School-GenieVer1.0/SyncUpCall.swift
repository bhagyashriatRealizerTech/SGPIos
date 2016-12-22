//
//  SyncUpCall.swift
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

class SyncUpCall{
    
    
    func syncUpData()
    {
        // Announcement and Attendance API call
        let annattapi = AnnouncemnetAttendanceAPI()
        annattapi.downloadAnnouncementAttendance {}
        
        
        //Homework API call
        let homeworkapi = HomeworkAPI()
        homeworkapi.downloadHomework {}
        
        //Classwork API call
        let classworkapi = ClassworkAPI()
        classworkapi.downloadClasswork {}
        
        //TimeTable API call
        let timetableapi = TimeTableAPI()
        timetableapi.downloadTimeTable {}
        
        //FunCenter Event API
        let funcentereventapi = FunCenterEventAPI()
        funcentereventapi.downloadFunCenterEvent {}
        
        //FunCenter Image API
        let funcenterimageapi = FunCenterImageAPI()
        funcenterimageapi.downloadFunCenterImage {}
    }
    
    
    
   }
