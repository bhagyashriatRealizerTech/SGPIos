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
            if Reachability.isConnectedToNetwork() == true {
                let urlString = imageurlString
                let request = PhotosDataManager.sharedManager.getNetworkImage(urlString: urlString) {image in
                    userImg = image
                }
            } else {
                
               /* let credentialerror = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                
                credentialerror.addAction(cancelAction)
                present(credentialerror, animated: true, completion: {  })*/
                
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
            if Reachability.isConnectedToNetwork() == true {
                let urlString = imageurlString
                let request = PhotosDataManager.sharedManager.getNetworkImage(urlString: urlString) {image in
                    userImg = image
                    imageView.image = userImg
                }
            }
        }
        
    }

    
}
