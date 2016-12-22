//
//  ChatTableCell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 17/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class ChatTableCell: UITableViewCell {

    @IBOutlet weak var imgchatlogo:UIImageView!
    @IBOutlet weak var lblusername:UILabel!
    @IBOutlet weak var lblchatmsg:UILabel!
    @IBOutlet weak var lbldate:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func updateCell(username:String,msgtext:String,attachmentExists:Bool,attachimage:String,currenttime:String)
    {
        lblusername.text = username;
        lblchatmsg.text = msgtext;
        lbldate.text=currenttime;
        if(!attachmentExists)
        {
                        imgchatlogo.image=#imageLiteral(resourceName: "unselect")
        }

        
        
    }

}
