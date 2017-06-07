//
//  SelectTeacher.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 17/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation
//
//  SelectTeacher.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 09/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//


class SelectTeacher
{
       private var _username:String!
       private var _attachmentExists:Bool!
    private var _attachimage:String!
    
    
    
    var username:String
    {
        return _username
        
    }
       var attachmentExists:Bool
    {
        return _attachmentExists
        
    }
    var attachimage:String{
        get{
            return _attachimage
        }
        set{
            _attachimage=newValue
        }
    }
    init(username:String,attachmentExists:Bool,attachimage:String)
    {
        _username=username
                _attachmentExists=attachmentExists
        _attachimage=attachimage
    }
    
    
}
