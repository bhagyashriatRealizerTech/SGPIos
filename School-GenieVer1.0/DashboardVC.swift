//
//  Dashboard.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 25/10/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet var dashbordview: UIView!
    
   
    @IBOutlet weak var pupilprofilepic: UIImageView!
    @IBOutlet weak var pupilStdDiv: UILabel!
    @IBOutlet weak var pupilName: UILabel!
   
    @IBOutlet weak var DashBoardBB: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        dashbordview.addGestureRecognizer(revealViewController().panGestureRecognizer())
 self.navigationController?.isNavigationBarHidden=false;
        self.navigationController?.navigationBar.barStyle=UIBarStyle.black
       self.navigationController?.navigationBar.barTintColor=UIColor(red:36/255,green:73/255,blue:210/255,alpha:1.0)
        
       self.navigationController?.navigationBar.tintColor=UIColor.white
        
        setprofileValue()
    }
    
    func setprofileValue(){
        
        let pupilname:String = UserDefaults.standard.value(forKey: "UserName") as! String
        let std = UserDefaults.standard.value(forKey: "Std") as! String
        let div = UserDefaults.standard.value(forKey: "Div") as! String
        
        let stddiv = std+" "+div
        let profileurl = UserDefaults.standard.value(forKey: "ProfilePic") as! String

        self.pupilName.text = pupilname
        self.pupilStdDiv.text = stddiv
        
        let v=self.pupilName.text
        let stArr = v?.components(separatedBy: " ")
        var st=""
        for s in stArr!{
            if let      str=s.characters.first{
                st+=String(str).capitalized
            }
        }
        
        if(profileurl.isEmpty)
        {
            let img = ImageToText()
            let tempimg = img.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
             self.pupilprofilepic.layer.borderColor = UIColor.gray.cgColor
             self.pupilprofilepic.layer.cornerRadius = 25.7
             self.pupilprofilepic.layer.masksToBounds = true
            self.pupilprofilepic.image = tempimg
            
        }
        else{
            
            let imagedownload = DownloadImage()
            
            let profileimage = imagedownload.userImage(imageurlString: profileurl)
            if(profileimage != nil)
            {
                 self.pupilprofilepic.layer.borderColor = UIColor.gray.cgColor
                 self.pupilprofilepic.layer.cornerRadius = 25.7
                 self.pupilprofilepic.layer.masksToBounds = true
                 self.pupilprofilepic.image = profileimage
            }
            else
            {
                let img = ImageToText()
                let tempimg = img.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
                self.pupilprofilepic.layer.borderColor = UIColor.gray.cgColor
                self.pupilprofilepic.layer.cornerRadius = 25.7
                self.pupilprofilepic.layer.masksToBounds = true
                self.pupilprofilepic.image = tempimg
                
            }
            
        }
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
