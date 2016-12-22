//
//  ThreadListsVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 19/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class ThreadListsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet var chatview: UIView!
    
    @IBOutlet weak var menu: UIBarButtonItem!
    var LastMsgList=[LastMsgDtls]()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        chatview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        

        
        let m1=LastMsgDtls(LastMsgSender: "Neha", Lastmsgtext: "Hello There, How are you, what's up ?", LastMsgTime: "09:30 AM", LastmsgSenderimage: "car.jpg")
        
        let m2=LastMsgDtls(LastMsgSender: "Swpnali", Lastmsgtext: "Please Resolve Swift issues, its taing time ", LastMsgTime: "07:30 AM", LastmsgSenderimage: "car.jpg")
        
        let m3=LastMsgDtls(LastMsgSender: "Bhagyashri", Lastmsgtext: "Android APK is deployed and ready for Demo", LastMsgTime: "Yesterday", LastmsgSenderimage: "car.jpg")
        
        let m4=LastMsgDtls(LastMsgSender: "Pravin", Lastmsgtext: "Could Deploy and connect to couchbase. please check assignment", LastMsgTime: "Yesterday", LastmsgSenderimage: "car.jpg")
        
        let m5=LastMsgDtls(LastMsgSender: "Ram", Lastmsgtext: "Sir, I have tested and shared defect list", LastMsgTime: "Thursday", LastmsgSenderimage: "car.jpg")
        
        let m6=LastMsgDtls(LastMsgSender: "Farhan", Lastmsgtext: "I am on Sick Leave. Please note", LastMsgTime: "Wednesday", LastmsgSenderimage: "car.jpg")
        
        
        LastMsgList.append(m1)
        LastMsgList.append(m2)
        LastMsgList.append(m3)
        LastMsgList.append(m4)
        LastMsgList.append(m5)
        LastMsgList.append(m6)
        
        tableview.dataSource=self
        tableview.delegate=self
        // TableLastMsgs.delegate=self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LastMessageTableCell",for:indexPath) as? LastMessageTableCell
        {
            
            let LastMsg=LastMsgList[indexPath.row]
            var msg = "\(LastMsg.LastMsgSender):\(LastMsg.Lastmsgtext)"
            cell.updateCell(lastMsgUser: LastMsg.LastMsgSender, lastMsgtext: "\(LastMsg.LastMsgSender):\(LastMsg.Lastmsgtext)", lastMsgSenderImg: LastMsg.LastmsgSenderimage, LastMsgTime: LastMsg.LastMsgTime)
            return cell
            
            
            //\(comhour):\(comminute)
        }
        return UITableViewCell()
    }
    
    //  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // return UITableViewCell()
    // if let cell=TableLastMsgs.dequeueReusableCell(withIdentifier: "LastMsgTableCell", for:indexPath) as? LastMsgTableCell
    
    //    {
    //  let LastMsg=LastMsgList[indexPath.row]
    //    cell.updateCell(lastMsgUser: LastMsg.LastMsgSender, lastMsgtext: LastMsg.Lastmsgtext, lastMsgSenderImg: LastMsg.LastmsgSenderimage, LastMsgTime: LastMsg.LastMsgTime)
    //  return cell
    
    //   }
    //   return UITableViewCell()
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let LastMsg=LastMsgList[indexPath.row]
        performSegue(withIdentifier: "SgueMessageCenter", sender: LastMsg)
        
    }
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let chat=ChatArr[indexPath.row]
     performSegue(withIdentifier: "SgueSelectChatCell", sender: chat)
     }*/
    
}
