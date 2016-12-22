//
//  MessageCenterCell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 21/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class MessageCenterCell: UITableViewCell {
    @IBOutlet weak var lbllastmsgtime: UILabel!
    
    @IBOutlet weak var imgteacher: UIImageView!
    @IBOutlet weak var lbllastmsg: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func updateCell(MsgSender:String,msgtext:String,MsgTime:String,msgSenderimage:String)
    {
        lblusername.text = MsgSender;
        lbllastmsg.text = msgtext;
        lbllastmsgtime.text=MsgTime;
        
        
        
    }
    
}
