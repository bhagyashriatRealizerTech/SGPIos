//
//  LoginResponseMethods.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 14/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation

class LoginResponseMethods{
    
    
    func storeLoginData(studentloginresponse:StudentLoginResponse){
        
        // Store Pupil Information
    let pupilinfo = PupilInformationMethods()
    pupilinfo.storeStudentDetail(studentdetail: (studentloginresponse.studentDtls)!)
        
        
        //Store Subject Allocation
        
    let subjectaloct = SubjectAllocationMethods()
    subjectaloct.storeSubjectAllocation(subjectallocation: (studentloginresponse.sa)!)
        
        //Store Public Holidays
        
    let publicholiday = PublicHolidayMethods()
    publicholiday.storePublicHoliday(publicholiday: (studentloginresponse.Phs)!)
        
        if((studentloginresponse.studentDtls?.ThumbnailURL) != nil)
        {
            let downloadimage = DownloadImage()
        downloadimage.userImage(imageurlString: (studentloginresponse.studentDtls?.ThumbnailURL)!)
        }
        
        
        
    }
    
    
}
