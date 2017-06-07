//
//  SelectTeacherVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 17/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class InitiateNewThreadVC: UIViewController{
   
    

    private var   _chatDtls:Chat!
    
    var chatDtls : Chat
        {
        get{
            return _chatDtls
        }
        set
        {
            _chatDtls = newValue
        }
    }

    
    
  
  
   
var SelectTeacherArr=[SelectTeacher]()
     let myImages=["Car.jpeg","Car.jpeg","Car.jpeg","Car.jpeg"]
 
    @IBOutlet weak var selectteacher: UITableView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   }
