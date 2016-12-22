//
//  SelectMessageCenterListVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 21/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class  SelectMessageCenterListVC: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var LastMsg=[Message]()
    
    @IBOutlet weak var TextviewMessage: UITextView!
    var placeholderLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextviewMessage.layer.borderColor=UIColor.black.cgColor
        TextviewMessage.layer.borderWidth=1
        
        let m1=Message(MsgSender: "Swapnali", msgtext: "Please Resolve Swift issues, its taing time ", MsgTime: "07:30 AM", msgSenderimage: "car.jpg")
        
        
        
        let m2=Message(MsgSender: "Bhagyashri", msgtext: "Android APK is deployed and ready for Demo", MsgTime: "Yesterday", msgSenderimage: "car.jpg")
        
        LastMsg.append(m1)
        LastMsg.append(m2)
        
        
        
        MessageCenter.dataSource=self
        MessageCenter.delegate=self
        
        
    }
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !TextviewMessage.text.isEmpty
    }
    @IBOutlet weak var MessageCenter: UITableView!
    
    @IBOutlet weak var lblmsgtime: UILabel!
    @IBOutlet weak var lblmsg: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    @IBOutlet weak var imgsender: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LastMsg.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCenterCell",for:indexPath) as? MessageCenterCell
        {
            
            let LastMsgtest=LastMsg[indexPath.row]
            cell.updateCell(MsgSender: LastMsgtest.MsgSender, msgtext: LastMsgtest.msgtext, MsgTime: LastMsgtest.MsgTime, msgSenderimage: LastMsgtest.msgSenderimage)
            return cell
        }
        return UITableViewCell()
        
    }
    
}
