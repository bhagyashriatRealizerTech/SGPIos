//
//  SelectMessageCenterListVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 21/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class  SelectMessageCenterListVC: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    fileprivate var _threadModel: LastMsgDtls!
    
    var threadModel: LastMsgDtls
        {
        
        get{
            return _threadModel
        }
        set
        {
            _threadModel = newValue
        }
    }

    
    
    var LastMsg=[ConversationModel]()
    
    @IBOutlet weak var TextviewMessage: UITextView!
    var placeholderLabel : UILabel!
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextviewMessage.layer.borderColor=UIColor.black.cgColor
        TextviewMessage.layer.borderWidth=1
        
       /* let m1=Message(MsgSender: "Swapnali", msgtext: "Please Resolve Swift issues, its taing time ", MsgTime: "07:30 AM", msgSenderimage: "car.jpg")
        
        
        
        let m2=Message(MsgSender: "Bhagyashri", msgtext: "Android APK is deployed and ready for Demo", MsgTime: "Yesterday", msgSenderimage: "car.jpg")
        
        
        LastMsg.append(m1)
        LastMsg.append(m2)*/
        
        let methodchat = ChatMethods()
        LastMsg = methodchat.getMessages(userid: threadModel.ThreadId)
        
        if(LastMsg.count > 0){
            
        MessageCenter.dataSource=self
        MessageCenter.delegate=self
            
        }
        
    }
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !TextviewMessage.text.isEmpty
    }
    @IBOutlet weak var MessageCenter: UITableView!
    
    
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
            
            let dateMethod = DateFile()
            let dattime = dateMethod.getDate(date: LastMsgtest.sentTime!, FLAG: "DT")
            cell.updateCell(MsgSender: LastMsgtest.from!, msgtext: LastMsgtest.text!, MsgTime: dattime, msgSenderimage: LastMsgtest.profileUrl!)
            return cell
        }
        return UITableViewCell()
        
    }
    
    @IBAction func sendMessagepressed(_ sender: Any) {
        if(_threadModel.ThreadId.isEmpty){
            let popup = UIAlertController(title: "Error", message: "Please select Teacher", preferredStyle:.alert )
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            popup.addAction(cancelAction)
            
            present(popup, animated: true, completion: {  })
            
        }
        else if(TextviewMessage.text.isEmpty){
            let popup = UIAlertController(title: "Error", message: "Please enter message", preferredStyle:.alert )
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            popup.addAction(cancelAction)
            
            present(popup, animated: true, completion: {  })
            
        }
        else{
            if Reachability.isConnectedToNetwork() == true {
                self.showActivityIndicator()
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "MM/dd/yyyy HH:mm:ss"
                let msgtxt:String = TextviewMessage.text
                let date:String = dateformatter.string(from: Date())
                let uuid = UUID().uuidString
                
                let userId:String = UserDefaults.standard.value(forKey: "UserId") as! String
                let username:String = UserDefaults.standard.value(forKey: "UserName") as! String
                let profilepic:String = UserDefaults.standard.value(forKey: "ProfilePic") as! String
                
                let msgObj = ConversationModel()
                msgObj.setMessage(chatId: uuid, fromteacher: false, schoolCode: "", fromId: userId, toId: _threadModel.ThreadId, message: msgtxt, msgTime: date, profilePic: profilepic, senderN: username)
                
                let chatMethods = ChatMethods()
                let initiate = ChatInitiateMethods()
                
                chatMethods.storeMessage(chatObj: msgObj)
                initiate.updateThread(userID: _threadModel.ThreadId, chatObj: msgObj)
                
                sendMesssage(completed: {}, msgObj: msgObj)
                
            } else {
                
                let credentialerror = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                
                credentialerror.addAction(cancelAction)
                self.present(credentialerror, animated: true, completion: {  })
                
            }
        }
        
    }
    
    
    func sendMesssage(completed: DownloadComplete,msgObj:ConversationModel){
        
        let methodName = "AddConversation"
        Current_Url = "\(BASE_URL)\(methodName)"
        print(Current_Url)
        
        let current_url = URL(string: Current_Url)!
        
        let accesstoken:String = UserDefaults.standard.value(forKey: "Accesstoken") as! String
        let schoolcode:String = UserDefaults.standard.value(forKey: "SchoolCode") as! String
        let userId:String = UserDefaults.standard.value(forKey: "UserId") as! String
        
        let parameters1 = ["SchoolCode":schoolcode,"ConversationId":msgObj.ConversationId!,"fromTeacher":msgObj.fromTeacher!,"from":userId,"to":msgObj.to!,"text":msgObj.text!,"sentTime":msgObj.sentTime?.components(separatedBy: " ")[0]] as [String : Any]
        
        let headers1:HTTPHeaders = ["AccessToken":accesstoken,
                                    "Content-Type": "application/json",
                                    "Accept": "application/json"]
        
        print(current_url)
        
        Alamofire.request(current_url, method: .post, parameters: parameters1, encoding: JSONEncoding.default, headers: headers1).responseString{ response in
            self.hideActivityIndicator()
            let result = response.result
            
            print(result.value)
            
            if(result.value != nil){
                let res:String = result.value!
                if(res == "true"){
                    
                    let methodchat = ChatMethods()
                    self.LastMsg.removeAll()
                    self.LastMsg = methodchat.getMessages(userid: self.threadModel.ThreadId)
                    
                    if(self.LastMsg.count > 0){
                        
                        self.MessageCenter.reloadData()
                        self.MessageCenter.dataSource=self
                        self.MessageCenter.delegate=self
                    }

                   
                }
                else{
                    let msgsenderror = UIAlertController(title: "Message Error", message: "Message sending failed", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                    
                    msgsenderror.addAction(cancelAction)
                    self.present(msgsenderror, animated: true, completion: {  })
                }
                
            }
            else{
                let msgsenderror = UIAlertController(title: "Message Error", message: "Message sending failed", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                
                msgsenderror.addAction(cancelAction)
                self.present(msgsenderror, animated: true, completion: {  })
            }
            
            
        }
        
        completed()
    }
    
    
    func showActivityIndicator() {
        
        // UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        DispatchQueue.main.async {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = UIColor.orange
            self.loadingView.alpha = 0.7
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10
            
            self.spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
            
            self.loadingView.addSubview(self.spinner)
            self.view.addSubview(self.loadingView)
            self.spinner.startAnimating()
            
        }
        
    }
    
    
    
    func hideActivityIndicator() {
        
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.loadingView.removeFromSuperview()
        }
    }
    

}
