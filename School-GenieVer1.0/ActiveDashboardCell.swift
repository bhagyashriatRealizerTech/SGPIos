//
//  ActiveDashboardCell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 05/01/17.
//  Copyright © 2017 Realizer. All rights reserved.
//

import UIKit

class ActiveDashboardCell: UITableViewCell {

    @IBOutlet weak var datenotif: UILabel!
    @IBOutlet weak var msgnotif: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var notifImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(Notiftitle:String, msgtext : String, date : String){
        
        title.text = Notiftitle
        msgnotif.text = msgtext
        let datefile = DateFile()
        let dateArr:[String] = date.components(separatedBy: "/")
        
        let ipdate:String = dateArr[1]+"/"+dateArr[2]+"/"+dateArr[0]
        var dateStr = datefile.getDate(date: ipdate, FLAG: "D")
        
        if(dateStr.isEmpty){
            dateStr = ipdate
        }
        datenotif.text = dateStr
        
        
        
        setNotifImage(imageview: notifImage, notif: Notiftitle)
        
        
    }
    

}
