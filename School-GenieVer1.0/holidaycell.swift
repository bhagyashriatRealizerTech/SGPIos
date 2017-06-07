//
//  holidaycell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 27/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class holidaycell: UITableViewCell {
    @IBOutlet weak var imgholidays: UIImageView!

    @IBOutlet weak var lblname: UILabel!
  
    @IBOutlet weak var lbltodate: UILabel!
    @IBOutlet weak var lblfromdt: UILabel!
    @IBOutlet weak var lblholidayevent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(holiday:String,fromdate:String,attachmentExists:Bool,attachimage:String,todate:String)
    {
        lblholidayevent.text = holiday;
        lblfromdt.text = fromdate;
        lbltodate.text=todate;
        
        let v=lblholidayevent.text
        let stArr = v?.components(separatedBy: " ")
        var st=""
        for s in stArr!{
            if let      str=s.characters.first{
                st+=String(str).capitalized
            }
        }
        
        let img = ImageToText()
        let tempimg = img.textToImage(drawText:st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
        self.imgholidays.layer.borderColor = UIColor.gray.cgColor
        /*senderimage.layer.cornerRadius = 25.7
         senderimage.layer.masksToBounds = true*/
        self.imgholidays.image = tempimg
        
        
        
    }


}
