//
//  AlertCell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 26/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class AlertCell: UITableViewCell {

    @IBOutlet weak var lblinitials: UILabel!
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var imgcategory: UIImageView!
    @IBOutlet weak var lblmsgtext: UILabel!
    @IBOutlet weak var lblcategory: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(category:String, msgtext : String, isAttachment : Bool,msgtime:String,initial:String)
    {
        lblcategory.text=getCategory(initials: category)
        lblmsgtext.text=msgtext
        lbltime.text=msgtime
        lblinitials.text=initial
        
    }
    
    func getCategory(initials:String) -> String{
        var category = initials
        
        if(initials == "SD")
        {
            category = "Sports Day"
        }
        else if(initials == "FDC")
        {
            category = "Fancy Dress Compitition"
        }
        else if(initials == "CM")
        {
            category = "Class Meeting"
        }
        else if(initials == "CA")
        {
            category = "Cultural Activity"
        }
        else if(initials == "O")
        {
            category = "Other"
        }
        
        return category
        
    }


}
