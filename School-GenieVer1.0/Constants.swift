//
//  Constants.swift
//  TestApp
//
//  Created by Mac on 02/12/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import Foundation
import CoreData

let BASE_URL = "http://45.35.4.250/SJRestWCF/svcEmp.svc/"
//let BASE_URL = "http://45.35.4.250/chat/api/chat/registerUser"

typealias DownloadComplete = () -> ()

var Current_Url = ""


func getContext () -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
}
