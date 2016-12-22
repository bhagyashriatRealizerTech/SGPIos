//
//  VerifyMailVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ObjectMapper

class VerifyMailVC: UIViewController {
  
    @IBOutlet weak var VerifyMailView: UIView!
    
    @IBOutlet weak var txtuserId: UITextField!
    
    @IBOutlet weak var lblHeaderverifyMail: UILabel!
    @IBOutlet weak var txtVerifyMail: UITextField!
    
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    
    func isValidEmail(testStr:String) -> Bool {
   
        
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }

    @IBAction func VeriftMailSubmitClick(_ sender: AnyObject) {
        if(txtuserId.text=="" )
        {
            let emailBtn = UIAlertController(title: "Verify UserID", message: "Please Enter your UserID", preferredStyle: .alert )
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            emailBtn.addAction(okAction)
            
            present(emailBtn, animated: true, completion: {  })
            

            
        }
        else if(txtVerifyMail.text=="")
        {
            let emailBtn = UIAlertController(title: "Verify Email", message: "Please Enter your Email ID", preferredStyle: .alert )
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            emailBtn.addAction(okAction)
            
            present(emailBtn, animated: true, completion: {  })
            
   
        }
        else if (isValidEmail(testStr: txtVerifyMail.text!)) {

        
        
           resetPasswordByEmail {}
           // setMagicWord {}
            
        }
        else{
            
            let emailBtn = UIAlertController(title: "Verify Email", message: "Invalid Email", preferredStyle: .alert )
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler:nil)
            
            emailBtn.addAction(okAction)
            
           
            present(emailBtn, animated: true, completion: {  })
            }
        
        
    }
    @IBAction func verifymailCancleclick(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        
        
    }
    @IBOutlet weak var lblentervalidmail: UILabel!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        VerifyMailView.layer.borderColor=UIColor.black.cgColor
        VerifyMailView.layer.borderWidth=1
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

       override func viewDidAppear(_ animated: Bool) {
       
    }
    
    func resetPasswordByEmail(completed: DownloadComplete){
        showActivityIndicator()
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let methodName = "sendStudForgotPassword/"
        let emailid:String = txtVerifyMail.text!
        let userid:String = txtuserId.text!+"/"
        Current_Url = "\(BASE_URL)\(methodName)\(userid)\(emailid)"
        
        
        let current_url = URL(string: Current_Url)!
        print(current_url)
        
        
        Alamofire.request(current_url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseString{ response in
            self.hideActivityIndicator()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            let result = response.result
            if(result.value != nil)
            {
            let res:String = result.value!
            
            print(res)
                
            if(res == "true")
            {
                let emailBtn = UIAlertController(title: "Verify Email", message: "Verification Sucesses....!!!!", preferredStyle: .alert )
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                
                
                emailBtn.addAction(okAction)
                
                self.present(emailBtn, animated: true, completion: {  })
                
            }
            else{
                let emailBtn = UIAlertController(title: "Verify Email", message: "Verification Failed....!!!!", preferredStyle: .alert )
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                
                
                emailBtn.addAction(okAction)
                
                self.present(emailBtn, animated: true, completion: {  })
                }
         }
            
        }
        completed()
    }
    
    func setMagicWord(completed: DownloadComplete){
        showActivityIndicator()
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let methodName = "setStudentMagicWord/"
        let magicword:String = txtVerifyMail.text!
       // var userid:String = UserDefaults.standard.value(forKey: "UserId") as! String
        //userid = userid + "/"
        let userid:String  = txtuserId.text!+"/"
        Current_Url = "\(BASE_URL)\(methodName)\(userid)\(magicword)"
        
        
        let current_url = URL(string: Current_Url)!
        print(current_url)
        
        
        Alamofire.request(current_url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseString{ response in
            self.hideActivityIndicator()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            let result = response.result
            if(result.value != nil)
            {
                let res:String = result.value!
                
                print(res)
                
                if(res == "true")
                {
                    let emailBtn = UIAlertController(title: "Set Magic Word", message: "Sucesses....!!!!", preferredStyle: .alert )
                    let okAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                    
                    
                    emailBtn.addAction(okAction)
                    
                    self.present(emailBtn, animated: true, completion: {  })
                    
                }
                else{
                    let emailBtn = UIAlertController(title: "Set Magic Word", message: "Failed....!!!!", preferredStyle: .alert )
                    let okAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                    
                    
                    emailBtn.addAction(okAction)
                    
                    self.present(emailBtn, animated: true, completion: {  })
                }
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
