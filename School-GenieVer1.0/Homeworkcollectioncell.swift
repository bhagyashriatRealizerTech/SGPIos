//
//  Homeworkcollectioncell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 25/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class Homeworkcollectioncell: UICollectionViewCell {
    
    @IBOutlet weak var imghomework: UIImageView!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
   
    func updateCell(url:String)
    {
        
        let imagedownload = DownloadImage()
        
        let profileimage = imagedownload.userImage(imageurlString: url)
        
        if(profileimage != nil){
            imghomework.image = profileimage
        }

    }

}
