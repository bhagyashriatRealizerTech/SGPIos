//
//  LastMessageTableCell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 19/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class LastMessageTableCell: UITableViewCell {
    
    @IBOutlet weak var lblLastMsgTime: UILabel!
    @IBOutlet weak var lblLastMsg: UILabel!
    @IBOutlet weak var senderimage: UIImageView!
    @IBOutlet weak var lblLastMsgSender: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    func updateCell(lastMsgUser:String,lastMsgtext:String,lastMsgSenderImg:String,LastMsgTime:String)
    {
        
        lblLastMsgSender.text = lastMsgUser;
        lblLastMsg.text = lastMsgtext;
        lblLastMsgTime.text=LastMsgTime;
        
    }
    
    
}
