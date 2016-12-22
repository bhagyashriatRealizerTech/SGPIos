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
        
        
        
        let m1=Menu(menulabel: "DashBoard", menuimage:#imageLiteral(resourceName: "home"))
        
         let m2=Menu(menulabel: "MyPupil", menuimage:#imageLiteral(resourceName: "mypupilN"))
        
         let m3=Menu(menulabel: "HomeWork", menuimage:#imageLiteral(resourceName: "homeworkN"))
        
        let m4=Menu(menulabel: "TimeTable", menuimage:#imageLiteral(resourceName: "timetable"))
        
        let m5=Menu(menulabel: "ClassWork", menuimage:#imageLiteral(resourceName: "classwork "))
        
         let m6=Menu(menulabel: "ViewStar", menuimage:#imageLiteral(resourceName: "starN"))
        
        
        let m7=Menu(menulabel: "Chat", menuimage:#imageLiteral(resourceName: "chat"))
        
        let m8=Menu(menulabel: "Alerts", menuimage:#imageLiteral(resourceName: "alertN"))
        
        let m9=Menu(menulabel: "Funcenter", menuimage:#imageLiteral(resourceName: "funcenterN"))
        

        let m10=Menu(menulabel: "Tracking", menuimage:#imageLiteral(resourceName: "trakingN"))
        
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
        
               
        switch indexPath.row
        {
        case 0 :
            performSegue(withIdentifier: "sguedashboard", sender: nil)
            print("Dashbord")
            break;
        case 1  :
             performSegue(withIdentifier: "sguepupil", sender: nil)
              self.navigationController?.isNavigationBarHidden=false;
            print("pupil")
            break  ;
        case 2  :
            
             performSegue(withIdentifier: "sguehomework", sender: nil)
            break;
        case 3:
             performSegue(withIdentifier: "sguetimetable", sender: nil)
            break;
        case 4:
            performSegue(withIdentifier: "sgueclasswork", sender: nil)
            break;
        case 5:
            
           
             performSegue(withIdentifier: "sguestar", sender: nil)
            break;
        case 6:
             performSegue(withIdentifier: "sguechat", sender: nil)
             
           
            break;
        case 7:
             performSegue(withIdentifier: "sguealert", sender: nil)
             
            break;
        case 8:
            performSegue(withIdentifier: "sguefuncenter", sender: nil)
           
            break;
        case 9:
            //tracking
                //performSegue(withIdentifier: "sguelogout", sender: nil)
          
            break;
        case 10:
            //synk

            let manualsync = SyncUpCall()
            manualsync.syncUpData()
            break;
            
           case 11:
          performSegue(withIdentifier: "sguelogout", sender: nil)
            break;
        default :
            print( "default case")
        }
        
                    /*else if(indexPath == 1)
                {
                   performSegue(withIdentifier: "sguedashboard", sender: nil)
               }*/
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