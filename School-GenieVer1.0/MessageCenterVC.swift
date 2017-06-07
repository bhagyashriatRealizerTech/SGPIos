//
//  SelectTeacherTestVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 18/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MessageCenterVC: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var viewhide: UIView!
    @IBOutlet weak var textviewmsg: UITextView!
    @IBOutlet weak var selectteacherbtn: UIButton!
    @IBOutlet weak var selectTecherpicker: UIPickerView!
    var teacher=[String]()
    var teacherId=[String]()
    var teacherImage=[String]()
    var suballocation = [SubjectAllocation]()
    var selectedteacher = String()
    var selectedteachername = String()
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    
    
    @IBAction func selectteacherclick(_ sender: AnyObject) {
        
        selectTecherpicker.isHidden=false
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewhide.isHidden=true
        textviewmsg.layer.borderColor=UIColor.black.cgColor
        textviewmsg.layer.borderWidth=1
        
        let suballocationmethod = SubjectAllocationMethods()
        suballocation = suballocationmethod.getAllTeacher()
        
        if(suballocation.count > 0){
            
            for index in 0...(suballocation.count - 1){
                if(!(suballocation[index].TeacherName?.isEmpty)!){
                teacher.append(suballocation[index].TeacherName!)
                teacherId.append(suballocation[index].TeacherUserId!)
                teacherImage.append(suballocation[index].ThumbNailURL!)
                }
            }
            
            if(teacher.count > 0){
                selectTecherpicker.dataSource=self
                selectTecherpicker.delegate=self
            }
        }
        else{
            viewhide.isHidden=false
            selectTecherpicker.isHidden=true
            
        }
        
        // Do any additional setup after loading the view.
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(LoginVC.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        
        
    }
    
    func didTapView(){
        self.view.endEditing(true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teacher.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teacher[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectteacherbtn.setTitle(teacher[row], for: UIControlState())
        selectTecherpicker.isHidden=true
        selectedteacher = teacherId[row]
        selectedteachername = teacher[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let  myView = UIView(frame: CGRect(x: 0, y: 0, width:pickerView.bounds.width-30 ,height: 30))
        
        
        let imgview:UIImageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        
        //let myImage:UIImage=UIImage(named:"flower.jpg")!
        imgview.layer.cornerRadius=15
        imgview.clipsToBounds=true
        imgview.layer.masksToBounds=false
        imgview.layer.borderColor = UIColor.gray.cgColor
        
        var rowString = String()
        rowString = teacher[row]
        
        let stArr = rowString.components(separatedBy: " ")
        var st=""
        for s in stArr{
            if let      str=s.characters.first{
                st+=String(str).capitalized
            }
        }
        
        let img = ImageToText()
        let tempimg = img.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
        imgview.layer.borderColor = UIColor.gray.cgColor
        imgview.layer.cornerRadius = 15.7
        imgview.layer.masksToBounds = true
        imgview.image = tempimg

        let imagedownload = DownloadImage()
        let temp = teacherImage[row]
        imagedownload.setImage(imageurlString: temp, imageView: imgview)
        
        
        let myLabel=UILabel(frame:(CGRect(x:100, y: 0, width: 200, height: 30)))
        
        
        myLabel.text = rowString
        
        myView.addSubview(myLabel)
        
        myView.addSubview(imgview)
        return myView
    }
    
    
    @IBAction func initiateNewTread(_ sender: Any) {
        
        if(selectedteacher.isEmpty){
            let popup = UIAlertController(title: "Error", message: "Please select Teacher", preferredStyle:.alert )
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            popup.addAction(cancelAction)
            
            present(popup, animated: true, completion: {  })

        }
        else if(textviewmsg.text.isEmpty){
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
                let msgtxt:String = textviewmsg.text
                let date:String = dateformatter.string(from: Date())
                let uuid = UUID().uuidString
                
                 let userId:String = UserDefaults.standard.value(forKey: "UserId") as! String
                let username:String = UserDefaults.standard.value(forKey: "UserName") as! String
                let profilepic:String = UserDefaults.standard.value(forKey: "ProfilePic") as! String
                
                let msgObj = ConversationModel()
                
                msgObj.setMessage(chatId: uuid, fromteacher: false, schoolCode: "", fromId: userId, toId: selectedteacher, message: msgtxt, msgTime: date, profilePic: "", senderN: profilepic)
                
                let chatMethods = ChatMethods()
                let chatinitmethods = ChatInitiateMethods()
                
                let chatobj = LastMsgDtls(LastMsgSender: username, Lastmsgtext: msgtxt, LastMsgTime: date, LastmsgSenderimage: "", LastMessageSenderID: userId, ThraedID: selectedteacher, ThreadName: selectedteachername)
                
                if(chatinitmethods.getThread(threadId: selectedteacher)){
                    
                    chatinitmethods.updateThread(userID: selectedteacher, chatObj: msgObj)
                }
                else{
                    chatinitmethods.storeThread(chatObj: chatobj)
                }
                
                chatMethods.storeMessage(chatObj: msgObj)
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
        
        let parameters1 = ["SchoolCode":schoolcode,"ConversationId":msgObj.ConversationId!,"fromTeacher":msgObj.fromTeacher!,"from":userId,
                           "to":msgObj.to!,"text":msgObj.text!,"sentTime":msgObj.sentTime?.components(separatedBy: " ")[0]] as [String : Any]
        
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
                
                self.performSegue(withIdentifier: "segueintiatetolist", sender: nil)
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
