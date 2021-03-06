//
//  MenuVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 30/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class MenuVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var MenuArr=[Menu]()
    /*var Image: [UIImage] = [
        UIImage(named: "Car.jpg")!,
        UIImage(named: "flower.jpg")!,UIImage(named: "Car.jpg")!,
        UIImage(named: "flower.jpg")!,UIImage(named: "Car.jpg")!,
        UIImage(named: "flower.jpg")!
    ]*/
    
    
    @IBOutlet weak var pupilname: UILabel!
    @IBOutlet weak var pupilimage: UIImageView!
    
    @IBOutlet weak var menutable: UITableView!
    override func viewDidLoad() {
        
                super.viewDidLoad()
        
        
        
        let m1=Menu(menulabel: "Dashboard", menuimage:#imageLiteral(resourceName: "home"))
        
         let m2=Menu(menulabel: "My Pupil", menuimage:#imageLiteral(resourceName: "mypupilN"))
        
         let m3=Menu(menulabel: "Homework", menuimage:#imageLiteral(resourceName: "homeworkN"))
        
        let m4=Menu(menulabel: "Time Table", menuimage:#imageLiteral(resourceName: "timetable"))
        
        let m5=Menu(menulabel: "Classwork", menuimage:#imageLiteral(resourceName: "classwork "))
        
         let m6=Menu(menulabel: "View Star", menuimage:#imageLiteral(resourceName: "starN"))
        
        
        let m7=Menu(menulabel: "Chat", menuimage:#imageLiteral(resourceName: "chat"))
        
        let m8=Menu(menulabel: "Alerts", menuimage:#imageLiteral(resourceName: "alertN"))
        
        let m9=Menu(menulabel: "Fun Center", menuimage:#imageLiteral(resourceName: "funcenterN"))
        let m10=Menu(menulabel: "Holiday", menuimage:#imageLiteral(resourceName: "holidayN"))


       
        
 let m11=Menu(menulabel: "Sync", menuimage:#imageLiteral(resourceName: "sync "))
        
        let m12=Menu(menulabel: "Logout", menuimage:#imageLiteral(resourceName: "logout "))
        
        MenuArr.append(m1)
        MenuArr.append(m2)
        MenuArr.append(m3)
        MenuArr.append(m4)
        MenuArr.append(m5)
        MenuArr.append(m6)
        MenuArr.append(m7)
        MenuArr.append(m8)
        MenuArr.append(m9)
        MenuArr.append(m10)
               
        
        MenuArr.append(m11)
        MenuArr.append(m12)
        
 

       menutable.dataSource=self
        menutable.delegate=self

        // Do any additional setup after loading the view.
        
        setProfileinfo()
    }
    
    func setProfileinfo()
    {
        let name:String = UserDefaults.standard.value(forKey: "UserName") as! String
        let thumbnailurl = UserDefaults.standard.value(forKey: "ProfilePic") as! String
        
        self.pupilname.text = name
        let v = self.pupilname.text
        let stArr = v?.components(separatedBy: " ")
        var st=""
        for s in stArr!{
            if let      str=s.characters.first{
                st+=String(str).capitalized
            }
        }
        
        if(thumbnailurl.isEmpty)
        {
            let img = ImageToText()
            let tempimg = img.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
            /*senderimage.layer.borderColor = UIColor.gray.cgColor
             senderimage.layer.cornerRadius = 25.7
             senderimage.layer.masksToBounds = true*/
            self.pupilimage.image = tempimg
            
        }
        else{
            
            let imagedownload = DownloadImage()
            
            let profileimage = imagedownload.userImage(imageurlString: thumbnailurl)
            if(profileimage != nil)
            {
                 self.pupilimage.layer.borderColor = UIColor.gray.cgColor
                 /*senderimage.layer.cornerRadius = 25.7
                 senderimage.layer.masksToBounds = true*/
                self.pupilimage.image = profileimage
            }
            else
            {
                let img = ImageToText()
                let tempimg = img.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
                self.pupilimage.layer.borderColor = UIColor.gray.cgColor
                /*senderimage.layer.cornerRadius = 25.7
                 senderimage.layer.masksToBounds = true*/
                self.pupilimage.image = tempimg
                
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuArr.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let rows = tableView.indexPathsForSelectedRows.map{$0.map{$0.row}}
        
        let revealviewcontroller:SWRevealViewController=self.revealViewController()
        let cell:MenuTableCell=tableView.cellForRow(at: indexPath) as! MenuTableCell
        
        if(cell.menu.text=="Dashboard"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="My Pupil"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "MyPupiScreenlVC") as! MyPupiScreenlVC
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="Homework"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "HomeWorkVC") as! HomeWorkVC
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="Classwork"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "ClassWorkVC") as! ClassWorkVC
            
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="Time Table"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "TimeTableVC") as! TimeTableVC
            
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="View Star"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "ViewStarVC") as! ViewStarVC
            
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="Chat"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "ThreadListsVC") as! ThreadListsVC
            
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="Alerts"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "AlertVC") as! AlertVC
            
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="Fun Center"){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "FuncentergalleryVC") as! FuncentergalleryVC
            
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
        }
        if(cell.menu.text=="Logout"){
            
           // let appDomain = Bundle.main.bundleIdentifier!
            //UserDefaults.standard.removePersistentDomain(forName: appDomain)
            print("session end")
            
            UserDefaults.standard.set(false, forKey: "IsLogin")
            let appDomain = Bundle.main.bundleIdentifier
            UserDefaults.standard.removePersistentDomain(forName: appDomain!)
            //performSegue(withIdentifier: "squelogout", sender:self)
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "MainVC") as! MainVC
             self.dismiss(animated: true, completion: nil)
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
            
           
        }

        if(cell.menu.text=="Holiday"){
            
           
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "HolidayVC1") as! HolidayVC1
            let frontview=UINavigationController.init(rootViewController:des)
            
            revealViewController().pushFrontViewController(frontview, animated:true)
           
        }
        if(cell.menu.text=="Sync"){
            
            
            let manualsync = SyncUpCall()
            
            manualsync.syncUpData()
            let emailBtn = UIAlertController(title: "Sucess", message: "Sync up Completed", preferredStyle: .alert )
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            emailBtn.addAction(okAction)
            
            present(emailBtn, animated: true, completion: {  })
            

        
        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "MenuTableCell", for:indexPath) as? MenuTableCell
            
        {
            let menu=MenuArr[indexPath.row]
            
            cell.updateCell(menulabel: menu.menulabel, menuimage: menu.menuimage)
            return cell
            
        }
            
        else{
            
            return UITableViewCell()
            
        }
        
        

    }
}
