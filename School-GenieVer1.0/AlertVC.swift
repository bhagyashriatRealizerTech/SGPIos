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
    @IBOutlet weak var alertTableview: UITableView!
var alert=[Alerts]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        menualert.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menualert.action = #selector(SWRevealViewController.revealToggle(_:))
        alertview.addGestureRecognizer(revealViewController().panGestureRecognizer())

        /*       let A1=Alerts(category: "Sports Day", msgText: "Today need to play the cricket", attachmentExists: true, attachimage: "SD",aldate: "9.30 AM",initial: "SD")
        
        let A2=Alerts(category: "Class Meeting", msgText: "All students parent will be present in meeting", attachmentExists: true, attachimage: "CT",aldate: "11.00 AM",initial: "CM")
        
        
        let A3=Alerts(category: "Culture Activity", msgText: "Celebrating the events...with our folk song", attachmentExists: true, attachimage: "CD",aldate: "Yesterday",initial: "CA")
        

        alert.append(A1)
        alert.append(A2)
        alert.append(A3)*/
        
        let announcement = AnnouncementMethods()
        alert = announcement.getAnnouncement()
        
        if(alert.count>0){
        alertTableview.dataSource=self
        alertTableview.delegate=self
       
        }
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination=segue.destination as? ShowAlertsVC
        {
            if let AL=sender as? Alerts{
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yy"
                let dateString = dateFormatter.string(from: NSDate() as Date!)
               AL.AlDate=dateString
    
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
            

            let v=at.category
            let stArr=v.components(separatedBy: " ")
            var st=""
            for s in stArr{
                if let      str=s.characters.first{
                    st+=String(str)
                }
                
            }
            
            
            print(st)
          cell.updateCell(category: at.category, msgtext: subText, isAttachment:at.attachmentExists, msgtime: at.aldate,initial: st)
        
           return cell
            
        }
            
 return UITableViewCell()
            
        
        
        
    }
    
    
        
        
        
  
    

}
