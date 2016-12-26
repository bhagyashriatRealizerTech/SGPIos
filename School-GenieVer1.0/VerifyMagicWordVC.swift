//
//  VerifyMagicWordVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 15/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ObjectMapper

class VerifyMagicWordVC: UIViewController {

    
    @IBOutlet weak var VerifyMagicwordView: UIView!
    
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtverifyMagicword: UITextField!
    
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    
    @IBAction func VerifyMagicsubmitClick(_ sender: AnyObject) {
        
        if(txtUserId.text==""){
            let Verifyuserid = UIAlertController(title: "Verify UserID", message: "Please Enter your User ID", preferredStyle: .alert )
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler:nil)
            
            
            Verifyuserid.addAction(cancelAction)
            
            present(Verifyuserid, animated: true, completion: {  })
            

            
        }
      else   if(txtverifyMagicword.text=="")
        {
            let VerifyMagic = UIAlertController(title: "CheckMagic Word", message: "Please Enter Your Magic Word", preferredStyle: .alert )
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler:nil)
            
            
            VerifyMagic.addAction(cancelAction)
            
                       present(VerifyMagic, animated: true, completion: {  })

                }
        else
        {
            resetPasswordByMagicWord {}
            
 
        }
    }
        
    @IBAction func VerifyMagicCancleclick(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VerifyMagicwordView.layer.borderColor=UIColor.black.cgColor
    VerifyMagicwordView.layer.borderWidth=1
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(LoginVC.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)


        // Do any additional setup after loading the view.
    }
    func didTapView(){
        self.view.endEditing(true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func resetPasswordByMagicWord(completed: DownloadComplete){
        showActivityIndicator()
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let methodName = "validateMagicWord/"
        let magicword:String = txtverifyMagicword.text!
        let userid:String = txtUserId.text!+"/"
        UserDefaults.standard.set(userid, forKey: "Uid")
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
                    self.performSegue(withIdentifier: "SgueMgicWordSubmit", sender: nil)
                    
                }
                else{
                    let emailBtn = UIAlertController(title: "Verify MagicWord", message: "Invalid UserId/MagicWord", preferredStyle: .alert )
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
