//
//  AlertViewImageVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 28/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class AlertViewImageVC: UIViewController {

    @IBOutlet weak var lblimgname: UILabel!
    @IBOutlet weak var imgview: UIImageView!
    private var   _cwDtls:Alerts!
    
    var CWDtls : Alerts
        {
        get{
            return _cwDtls
        }
        set
        {
            _cwDtls = newValue
        }
    }

    override func viewDidLoad() {
       
        super.viewDidLoad()
        let imagedownload = DownloadImage()
        let temp = CWDtls.attachimage
        imagedownload.setImage(imageurlString: temp, imageView: imgview)
       /* let profileimage = imagedownload.userImage(imageurlString: temp)
        
        if(profileimage != nil){
            imgview.image = profileimage
        }*/
        lblimgname.text = CWDtls.category
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
