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

typealias DownloadComplete = () -> ()

var Current_Url = ""


func getContext () -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
}

func setStarImage(imageview:UIImageView, star:String){
    if(star == "Great"){
        imageview.image = #imageLiteral(resourceName: "great")
    }
    else if(star == "WellDone"){
        imageview.image = #imageLiteral(resourceName: "welldone")
    }
    else if(star == "NiceWork"){
       imageview.image = #imageLiteral(resourceName: "nicework")
    }
    else if(star == "Terrific"){
      imageview.image = #imageLiteral(resourceName: "terrific")
    }
    else if(star == "VeryGood"){
      imageview.image = #imageLiteral(resourceName: "verygood")
    }
    else if(star == "Super"){
      imageview.image = #imageLiteral(resourceName: "super")
    }


}
