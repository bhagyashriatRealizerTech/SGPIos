//
//  AlertVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 26/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ObjectMapper
class AlertVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var menualert: UIBarButtonItem!
    @IBOutlet var alertview: UIView!
    @IBOutlet weak var hideview: UIView!
    @IBOutlet weak var alertTableview: UITableView!
var alert=[Alerts]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        hideview.isHidden=true
        menualert.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menualert.action = #selector(SWRevealViewController.revealToggle(_:))
        alertview.addGestureRecognizer(revealViewController().panGestureRecognizer())

        NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)),name:NSNotification.Name(rawValue: "loadAlert"), object: nil)
     
        let announcement = AnnouncementMethods()
        alert = announcement.getAnnouncement()
        
        if(alert.count>0){
            alert.reverse()
        alertTableview.dataSource=self
        alertTableview.delegate=self
       
        }
        else{
            alertTableview.isHidden=true
            alertTableview.separatorColor=UIColor.white
            hideview.isHidden=false
        }
  }
    
    func loadList(notification: NSNotification){
        
        let announcement = AnnouncementMethods()
        alert = announcement.getAnnouncement()

        if(alert.count>0){
            alert.reverse()
            alertTableview.dataSource=self
            alertTableview.delegate=self
            alertTableview.reloadData()
            
            alertTableview.isHidden=false
            alertTableview.separatorColor=UIColor.orange
            hideview.isHidden=true
            
        }
        else{
            alertTableview.isHidden=true
            alertTableview.separatorColor=UIColor.white
            hideview.isHidden=false
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination=segue.destination as? ShowAlertsVC
        {
            if let AL=sender as? Alerts{
                
                var datestring:String = AL.aldate
                let datefile = DateFile()
                datestring = datefile.getMediumDate(date: AL.aldate.components(separatedBy: " ")[0])
               AL.aldate = datestring
    
                destination.ALDtls=AL
 
        }
               }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alert.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var als=alert[indexPath.row]
        performSegue(withIdentifier: "SgueAlerts", sender: als)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if let cell=tableView.dequeueReusableCell(withIdentifier: "AlertCell", for:indexPath) as? AlertCell
            
        {
            let at=alert[indexPath.row]
            var subText = ""
            
            
            let myNSString =  at.msgText as NSString
            if(myNSString.length > 55)
            {
                subText =    myNSString.substring(with: NSRange(location: 0, length: 54))
                subText = subText.appending("...")
            }
            else
            {
                subText = at.msgText
            }
            

            
            
            var datestring:String = at.aldate
            let datefile = DateFile()
            datestring = datefile.getDate(date: at.aldate.components(separatedBy: " ")[0], FLAG: "D")
            //print(st)
          cell.updateCell(category: at.category, msgtext: subText, isAttachment:at.attachmentExists, msgtime: datestring,initial: at.category)
        
           return cell
            
        }
        else{
            
            
            return UITableViewCell()
        }
        
    }
    

}
