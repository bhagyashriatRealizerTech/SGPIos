//
//  TimeTableColViewCell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 21/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class TimeTableColViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgtimetable: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func updateCell(url:String)
    {
        
        let imagedownload = DownloadImage()
        imagedownload.setImage(imageurlString: url, imageView: imgtimetable)
        
        /*let profileimage = imagedownload.userImage(imageurlString: url)
        
        if(profileimage != nil){
            imgtimetable.image = profileimage
        }*/
        
    }
    

}
