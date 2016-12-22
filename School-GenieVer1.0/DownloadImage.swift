//
//  DownloadImage.swift
//  ChatDemo
//
//  Created by sachin shinde on 12/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class DownloadImage{
    
    
    func userImage(imageurlString: String) -> Image? {
        
        var userImg:Image? = nil
        if PhotosDataManager.sharedManager.cachedImage(urlString: imageurlString) != nil
        {
            userImg = PhotosDataManager.sharedManager.cachedImage(urlString: imageurlString)
        }
            
        else
        {
            let urlString = imageurlString
            let request = PhotosDataManager.sharedManager.getNetworkImage(urlString: urlString) {image in
                userImg = image
            }
            
            
            
        }
        return userImg
    }
    
    func setImage(imageurlString: String, imageView: UIImageView) {
        
        var userImg:Image? = nil
        if PhotosDataManager.sharedManager.cachedImage(urlString: imageurlString) != nil
        {
            userImg = PhotosDataManager.sharedManager.cachedImage(urlString: imageurlString)
            imageView.image = userImg
        }
            
        else
        {
            let urlString = imageurlString
            let request = PhotosDataManager.sharedManager.getNetworkImage(urlString: urlString) {image in
                userImg = image
                imageView.image = userImg
            }
            
            
            
        }
        
    }

    
}
