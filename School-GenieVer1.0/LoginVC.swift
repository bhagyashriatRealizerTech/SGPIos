//
//  ViewController.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 24/10/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ObjectMapper

class LoginVC : UIViewController {
    @IBOutlet weak var menubar: UIBarButtonItem!

    @IBOutlet weak var FWbtnsubmit: UIButton!
    @IBOutlet weak var FWbtnmagic: UIButton!
    
    @IBOutlet weak var FWradiomagic: UIButton!
    @IBOutlet weak var FWbtnEmail: UIButton!
    @IBOutlet weak var FWradioEmail: UIButton!
    @IBOutlet var mainview: UIView!
    @IBOutlet weak var PopupView: UIView!
    
    @IBOutlet weak var txtUserId: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    
    @IBAction func verifyMailCancelbtn(_ sender: AnyObject) {
        FWcheckmailview.isHidden=true
        PopupView.isHidden=false
    }
    
    @IBOutlet weak var FWcheckmailview: UIView!
    
    @IBAction func FWradiomagicClick(_ sender: AnyObject) {
        
        
        if(FWradiomagic.currentImage == #imageLiteral(resourceName: "selected.jpg"))
        {
            FWradioEmail.setImage(#imageLiteral(resourceName: "unselect"), for:UIControlState.normal)
           FWradiomagic.setImage(#imageLiteral(resourceName: "unselect"), for:UIControlState.normal)
        }
        else
        {
            FWradiomagic.setImage(#imageLiteral(resourceName: "selected.jpg"), for:UIControlState.normal)
            if(FWradioEmail.currentImage==#imageLiteral(resourceName: "selected"))
            {
            FWradioEmail.setImage(#imageLiteral(resourceName: "unselect"), for:UIControlState.normal)
            }
        }
    }
    
    @IBAction func FWbtnradioEmailclick(_ sender: AnyObject) {
        
        
         if(FWradioEmail.currentImage == #imageLiteral(resourceName: "selected.jpg"))
            {
                FWradiomagic.setImage(#imageLiteral(resourceName: "unselect"),for:UIControlState.normal)
                
          FWradioEmail.setImage(#imageLiteral(resourceName: "unselect"), for:UIControlState.normal)
                
            }
            else
            {
          FWradioEmail.setImage(#imageLiteral(resourceName: "selected.jpg"), for:UIControlState.normal)
                if(FWradioEmail.currentImage==#imageLiteral(resourceName: "selected"))
                {
                   FWradiomagic.setImage(#imageLiteral(resourceName: "unselect"), for:UIControlState.normal)
                }
                
            }
        
    }

    
    @IBOutlet var VerifyEmailtxt: UITextField!
    



func isValidEmail(testStr:String) -> Bool {
    
    
    print("validate emilId: \(testStr)")
    let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate(with: testStr)
    return result
}


    
    
    @IBAction func logincClick(_ sender: AnyObject) {
        
        if(!(txtUserId.text?.isEmpty)! && !(txtPassword.text?.isEmpty)!)
        {
        let methodName = "StudentLogin/"
        let Username = txtUserId.text!+"/"
        let Password = txtPassword.text!+"/"
        let Device_Id = "1234567"

        Current_Url = "\(BASE_URL)\(methodName)\(Username)\(Password)\(Device_Id)"
        print(Current_Url)
            
            if Reachability.isConnectedToNetwork() == true {
                downloadLoginDetails{}
            } else {
                
                let credentialerror = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                
                credentialerror.addAction(cancelAction)
                self.present(credentialerror, animated: true, completion: {  })

            }
        
        }
        
    }
    
    func downloadLoginDetails(completed: DownloadComplete){
        showActivityIndicator()
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        let current_url = URL(string: Current_Url)!
        
        
        
        
        Alamofire.request(current_url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON{ response in
            self.hideActivityIndicator()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            let result = response.result
            
            print(result.value)
            if let dict = result.value as? [String: AnyObject]
            {
                
                if let StudentloginResult = dict["StudentloginResult"] as? Dictionary<String, AnyObject>
                {
                    
                    let res = Mapper<StudentLoginResponse>().map(JSONObject: StudentloginResult)
                   // print((res?.AccessToken)!)
                    
                    let loginres = (res?.loginResult)!
                    
                    if(loginres == "valid")
                    {
                        
                        let userId = self.txtUserId.text! as String
                        var thumbnailURL:String = ""
                        let accestokn:String = (res?.AccessToken)!
                        let deviceId:String = "1234567"
                        let UserName: String = (res?.studentDtls?.fName)!+" "+(res?.studentDtls?.lName)!
                        if((res?.studentDtls?.ThumbnailURL) != nil)
                        {
                            thumbnailURL = (res?.studentDtls?.ThumbnailURL)!
                        }
                        let schoolcode:String = (res?.studentDtls?.schoolCode)!
                        let std:String = (res?.studentDtls?.std)!
                        let div:String = (res?.studentDtls?.division)!
                        
                        var academicyear:String = "2016"
                            if((res?.studentDtls?.academicYear) != nil)
                            {
                            academicyear = (res?.studentDtls?.academicYear)!
                        }

                        UserDefaults.standard.set(userId, forKey: "UserId")
                        UserDefaults.standard.set(thumbnailURL, forKey: "ProfilePic")
                        UserDefaults.standard.set(accestokn, forKey: "Accesstoken")
                        UserDefaults.standard.set(deviceId, forKey: "DeviceId")
                        UserDefaults.standard.set(UserName, forKey: "UserName")
                        UserDefaults.standard.set(schoolcode, forKey: "SchoolCode")
                        UserDefaults.standard.set(std, forKey: "Std")
                        UserDefaults.standard.set(div, forKey: "Div")
                        UserDefaults.standard.set(academicyear, forKey: "AcademicYear")
                        
                        print(res?.Phs?.count)
                        print(res?.sa?.subjAllocation?.count)
                        
                        let logindtls = LoginResponseMethods()
                        logindtls.storeLoginData(studentloginresponse: res!)
                        
                        self.performSegue(withIdentifier: "logintodashboard", sender: nil)
                        
                    }
                    else if(loginres == "invalid"){
                        let credentialerror = UIAlertController(title: "Login", message: "Invalid credentials", preferredStyle: .alert)
                        
                        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                        
                        
                        
                        
                        credentialerror.addAction(cancelAction)
                        
                        
                        self.present(credentialerror, animated: true, completion: {  })

                    }
                    else{
                        let credentialerror = UIAlertController(title: "Login", message: "Please try after some time", preferredStyle: .alert)
                        
                        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                        
                        
                        
                        
                        credentialerror.addAction(cancelAction)
                        
                        
                        self.present(credentialerror, animated: true, completion: {  })
                        
                    }

                    //TODO Insert Value in Database
                }
                else{
                    
                        let credentialerror = UIAlertController(title: "Login", message: "Please try after some time", preferredStyle: .alert)
                        
                        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                        
                        
                        
                        
                        credentialerror.addAction(cancelAction)
                        
                        
                        self.present(credentialerror, animated: true, completion: {  })
                        

                }
            }
            
            
            
        }
        completed()
    }
    
    
    
    @IBAction func verifyBtnclick(_ sender: AnyObject) {
        
        if (isValidEmail(testStr: VerifyEmailtxt.text!)) {
            
            
            
            
            
            
            let emailBtn = UIAlertController(title: "Verification Suceed!!!!", message: "welcome....", preferredStyle: .alert )
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
           
            emailBtn.addAction(cancelAction)
            emailBtn.addAction(okAction)
            
            present(emailBtn, animated: true, completion: {  })
            
            
            
            
        } else {
            let emailBtn = UIAlertController(title: "Verify Email", message: "Invalid Email", preferredStyle: .alert )
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
          
            emailBtn.addAction(cancelAction)
            emailBtn.addAction(okAction)
            
           
            present(emailBtn, animated: true, completion: {  })
            
        }
       
        
    }
   
    @IBAction func FWbtnDissmiss(_ sender: AnyObject) {
        PopupView.isHidden=true
        mainview.alpha=1
    }
    @IBAction func FWbtnsubmitclick(_ sender: AnyObject) {
        
    
        if(FWradioEmail.currentImage==#imageLiteral(resourceName: "selected"))
        {
            FWcheckmailview.isHidden=false
            PopupView.isHidden=true
            FWcheckmailview.layer.cornerRadius=10
            FWcheckmailview.layer.masksToBounds=true
            
        }
        else
        {
            
            let popup = UIAlertController(title: "Error", message: "Please select button", preferredStyle:.alert )
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
            popup.addAction(cancelAction)
            
            present(popup, animated: true, completion: {  })
            
            
            
        }
        
    }
    
    @IBOutlet weak var SVLoginImage: UIStackView!
    @IBOutlet weak var imgLoginBG: UIImageView!
    @IBAction func forwordclick(_ sender: AnyObject) {
        
           }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // menubar.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
      //  menubar.action = #selector(SWRevealViewController.revealToggle(_:))
       // self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        

       self.navigationController?.isNavigationBarHidden=true;
        
     
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.default;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=true;
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

