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
        
        let v=lblLastMsgSender.text
        let stArr = v?.components(separatedBy: " ")
        var st=""
        for s in stArr!{
            if let      str=s.characters.first{
                st+=String(str).capitalized
            }
        }
        
        if(lastMsgSenderImg=="")
        {
            let img = ImageToText()
            let tempimg = img.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
            senderimage.layer.borderColor = UIColor.gray.cgColor
            senderimage.layer.cornerRadius = 25.7
            senderimage.layer.masksToBounds = true
            senderimage.image = tempimg
            
        }
        else{
            
            let imagedownload = DownloadImage()
            
            let profileimage = imagedownload.userImage(imageurlString: lastMsgSenderImg)
            if(profileimage != nil)
            {
                senderimage.layer.borderColor = UIColor.gray.cgColor
                senderimage.layer.cornerRadius = 25.7
                senderimage.layer.masksToBounds = true
                senderimage.image = profileimage
            }
            else
            {
                let img = ImageToText()
                let tempimg = img.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
                senderimage.layer.borderColor = UIColor.gray.cgColor
                senderimage.layer.cornerRadius = 25.7
                senderimage.layer.masksToBounds = true
                senderimage.image = tempimg
                
            }
            
        }
        
        
    }
    
    
}
