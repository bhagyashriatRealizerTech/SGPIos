//
//  ResetPasswordVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ObjectMapper

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var ResetPasswordView: UIView!
    
    @IBOutlet weak var ResetPasswordtxtConfPassword: UITextField!
    @IBOutlet weak var resetpasswordtxtPassword: UITextField!
    
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    
    @IBAction func ResetPasswordSubmit(_ sender: AnyObject) {
        
    if(resetpasswordtxtPassword.text=="")
    {
        let passwordcheck = UIAlertController(title: "Empty Password", message: "Please Enter Password", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
        
        
        
       
        passwordcheck.addAction(cancelAction)
        
       
        present(passwordcheck, animated: true, completion: {  })
        
        }
    else{
        if(resetpasswordtxtPassword.text==ResetPasswordtxtConfPassword.text)
        {
            
            resetPassword {}
        }
        else{
            let passwordcheck = UIAlertController(title: "Missmatch Password", message: "Password Not Match", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
           
            
            passwordcheck.addAction(cancelAction)
            
           
            present(passwordcheck, animated: true, completion: {  })
        }
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       ResetPasswordView.layer.borderColor=UIColor.black.cgColor
        ResetPasswordView.layer.borderWidth=1
        // Do any additional setup after loading the view.
    }
    

    @IBAction func ResetPasswordCancleClick(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func resetPassword(completed: DownloadComplete){
        showActivityIndicator()
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let methodName = "setPassword/"
        var userdid:String = UserDefaults.standard.value(forKey: "Uid") as! String
        userdid = userdid + "/"
        let password:String = resetpasswordtxtPassword.text!
        Current_Url = "\(BASE_URL)\(methodName)\(userdid)\(password)"
        
        
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
                    let emailBtn = UIAlertController(title: "Reset Password", message: "New Password set successfully!! ", preferredStyle: .alert )
                    let okAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                    
                    
                    emailBtn.addAction(okAction)
                    
                    self.present(emailBtn, animated: true, completion: {  })
                    
                }
                else{
                    let emailBtn = UIAlertController(title: "Reset Password", message: "Reset Password Failed", preferredStyle: .alert )
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
