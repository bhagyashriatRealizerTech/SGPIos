//
//  Dashboard.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 25/10/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var pupilnameStackV: UIStackView!
    @IBOutlet weak var pupildpStackV: UIStackView!
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet var dashbordview: UIView!
    
    @IBOutlet weak var activedashboard: UITableView!
   
    @IBOutlet weak var btnmypupil: UIButton!
    @IBOutlet weak var pupilprofilepic: UIImageView!
    @IBOutlet weak var pupilStdDiv: UILabel!
    @IBOutlet weak var pupilName: UILabel!
   
    @IBOutlet weak var btnhomework: UIButton!
    @IBOutlet weak var btnalert: UIButton!
    @IBOutlet weak var DashBoardBB: UIBarButtonItem!
    @IBOutlet weak var btnclass: UIButton!
    @IBOutlet weak var btnstar: UIButton!
    @IBOutlet weak var btnchat: UIButton!
    @IBOutlet weak var btnfun: UIButton!
    @IBOutlet weak var starbtn: UIButton!
    @IBOutlet weak var holiday: UIButton!
    
    var activeNotification:[ActiveDashboard] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)),name:NSNotification.Name(rawValue: "loadActive"), object: nil)
       
        let activemethods = ActiveDashboardMethods()
        activeNotification = activemethods.getActiveDashboard()
        
        if(activeNotification.count > 0){
            
            activedashboard.isHidden = false
            pupildpStackV.isHidden = true
            pupilnameStackV.isHidden = true
            
            activedashboard.delegate = self
            activedashboard.dataSource = self
            
        }
        else{
            activedashboard.isHidden = true
            pupildpStackV.isHidden = false
            pupilnameStackV.isHidden = false
        }
        
        
        
       starbtn.backgroundColor = .clear
        // button.layer.cornerRadius = 5
        starbtn.layer.borderWidth = 1
   starbtn.layer.borderColor = UIColor.darkGray.cgColor
        
        holiday.backgroundColor = .clear
        // button.layer.cornerRadius = 5
       holiday.layer.borderWidth = 1
        holiday.layer.borderColor = UIColor.darkGray.cgColor
        
       btnmypupil.backgroundColor = .clear
       // button.layer.cornerRadius = 5
      btnmypupil.layer.borderWidth = 1
        btnmypupil.layer.borderColor = UIColor.darkGray.cgColor
        
        
        
      btnhomework.backgroundColor = .clear
        // button.layer.cornerRadius = 5
          btnhomework.layer.borderWidth = 1
         btnhomework.layer.borderColor = UIColor.darkGray.cgColor
        
        btnstar.backgroundColor = .clear
        // button.layer.cornerRadius = 5
     btntime.layer.borderWidth = 1
       btntime.layer.borderColor = UIColor.darkGray.cgColor
        
        btnchat.backgroundColor = .clear
        // button.layer.cornerRadius = 5
       btnchat.layer.borderWidth = 1
        btnchat.layer.borderColor = UIColor.darkGray.cgColor

        
        btnchat.backgroundColor = .clear
        // button.layer.cornerRadius = 5
        btnchat.layer.borderWidth = 1
        btnchat.layer.borderColor = UIColor.darkGray.cgColor
        
       btnfun.backgroundColor = .clear
        // button.layer.cornerRadius = 5
       btnfun.layer.borderWidth = 1
       btnfun.layer.borderColor = UIColor.darkGray.cgColor
        
        
       btnalert.backgroundColor = .clear
        // button.layer.cornerRadius = 5
       btnalert.layer.borderWidth = 1
       btnalert.layer.borderColor = UIColor.darkGray.cgColor
        

       btnclass.backgroundColor = .clear
        // button.layer.cornerRadius = 5
       btnclass.layer.borderWidth = 1
       btnclass.layer.borderColor = UIColor.darkGray.cgColor
       // btnclass.titleLabel="ClassWork"
        

        
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        dashbordview.addGestureRecognizer(revealViewController().panGestureRecognizer())
 self.navigationController?.isNavigationBarHidden=false;
        self.navigationController?.navigationBar.barStyle=UIBarStyle.black
      // self.navigationController?.navigationBar.barTintColor=UIColor(red:36/255,green:73/255,blue:210/255,alpha:1.0)
        
       self.navigationController?.navigationBar.tintColor=UIColor.black
        
        setprofileValue()
    }
    @IBOutlet weak var btntime: UIButton!
    
    func loadList(notification: NSNotification){
        
        let activemethods = ActiveDashboardMethods()
        activeNotification = activemethods.getActiveDashboard()
        
        if(activeNotification.count > 0){
            
            activedashboard.isHidden = false
            pupildpStackV.isHidden = true
            pupilnameStackV.isHidden = true
            
            activedashboard.delegate = self
            activedashboard.dataSource = self
            activedashboard.reloadData()
            
        }
        else{
            activedashboard.isHidden = true
            pupildpStackV.isHidden = false
            pupilnameStackV.isHidden = false
        }
        
        
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
             self.pupilprofilepic.layer.cornerRadius = 40
             self.pupilprofilepic.layer.masksToBounds = true
            self.pupilprofilepic.image = tempimg
            
        }
        else{
            
            let imagedownload = DownloadImage()
            
            let profileimage = imagedownload.userImage(imageurlString: profileurl)
            if(profileimage != nil)
            {
                 self.pupilprofilepic.layer.borderColor = UIColor.gray.cgColor
                 self.pupilprofilepic.layer.cornerRadius = 40
                 self.pupilprofilepic.layer.masksToBounds = true
                 self.pupilprofilepic.image = profileimage
            }
            else
            {
                let img = ImageToText()
                let tempimg = img.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
                self.pupilprofilepic.layer.borderColor = UIColor.gray.cgColor
                self.pupilprofilepic.layer.cornerRadius = 40
                self.pupilprofilepic.layer.masksToBounds = true
                self.pupilprofilepic.image = tempimg
                
            }
            
        }
        

        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=false;
        
        self.navigationController?.navigationBar.barStyle=UIBarStyle.default
        // self.navigationController?.navigationBar.barTintColor=UIColor(red:36/255,green:73/255,blue:210/255,alpha:1.0)
        
        self.navigationController?.navigationBar.tintColor=UIColor.black
        self.navigationItem.title="Dashboard"
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        dashbordview.addGestureRecognizer(revealViewController().panGestureRecognizer())


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return activeNotification.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v:UIView = UIView()
        v.backgroundColor = UIColor.clear
        return v
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell=tableView.dequeueReusableCell(withIdentifier: "ActiveDashboardCell", for:indexPath) as? ActiveDashboardCell
            
        {
            let activeNotif=activeNotification[indexPath.section]
            var msgText = ""
            
            
            let myNSString =  activeNotif.Message as NSString
            if(myNSString.length > 55)
            {
                msgText =    myNSString.substring(with: NSRange(location: 0, length: 54))
                msgText = msgText.appending("...")
            }
            else
            {
                msgText = activeNotif.Message
            }
            
            var datestring:String = activeNotif.Date
            let datefile = DateFile()
            //datestring = datefile.getDate(date: activeNotif.Date.components(separatedBy: " ")[0], FLAG: "D")
            
            
            cell.updateCell(Notiftitle: activeNotif.Title, msgtext: msgText, date: activeNotif.Date)
            
           
            var cellBackgroundView:UIImageView = UIImageView(image: #imageLiteral(resourceName: "cellbg1"))
            cellBackgroundView.image = #imageLiteral(resourceName: "cellbg1")
            cell.backgroundView = cellBackgroundView
            cell.layer.cornerRadius = 8
            return cell
            
        }
            
        else{
            
            return UITableViewCell()
            
        }

    }

   
}
