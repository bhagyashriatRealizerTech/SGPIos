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
    
        let chatinitiatemethod = ChatInitiateMethods()
        LastMsgList = chatinitiatemethod.getThreadList()
        
        if(LastMsgList.count>0)
        {
        tableview.dataSource=self
        tableview.delegate=self
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
        return LastMsgList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LastMessageTableCell",for:indexPath) as? LastMessageTableCell
        {
            
            let LastMsg=LastMsgList[indexPath.row]
            
            
            let dateT = LastMsg.LastMsgTime.components(separatedBy: " ")[0]
            
            
            let dateD = DateFile()
            let date = dateD.getDate(date: dateT, FLAG: "D")

            
            var msg = "\(LastMsg.LastMsgSender):\(LastMsg.Lastmsgtext)"
              //let date = dateFormatter.string(from: dateD!)
            cell.updateCell(lastMsgUser: LastMsg.ThreadName, lastMsgtext: "\(LastMsg.LastMsgSender):\(LastMsg.Lastmsgtext)", lastMsgSenderImg: LastMsg.LastmsgSenderimage, LastMsgTime: date)
            
            return cell
        }
        else{
            tableView.isHidden=true
            tableView.separatorColor=UIColor.white
        return UITableViewCell()
    }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let LastMsg=LastMsgList[indexPath.row]
        performSegue(withIdentifier: "SgueMessageCenter", sender: LastMsg)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SelectMessageCenterListVC
        {
            if let timeTable1 = sender as? LastMsgDtls{
                destination.threadModel = timeTable1
            }
            
        }
    }
       
}
