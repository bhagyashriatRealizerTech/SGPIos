//
//  ForgotPasswordPopupVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 14/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ObjectMapper


class ForgotPasswordPopupVC: UIViewController {

    @IBOutlet weak var PwdRecoveryPanel: UIView!
    @IBOutlet weak var FWbtnsubmit: UIButton!
    
    @IBOutlet weak var FWradiomagic: UIButton!
    
    @IBOutlet weak var FWradioEmail: UIButton!
    

    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
self.view.layoutIfNeeded()
        PwdRecoveryPanel.layer.borderColor=UIColor.black.cgColor
        PwdRecoveryPanel.layer.borderWidth=1
        FWradioEmail.setImage(#imageLiteral(resourceName: "selected"), for: UIControlState.normal)
       // self.view.alpha=0.3
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
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
    

   
    @IBAction func CancelClick(_ sender: UIButton) {
        
      self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func SubmitClick(_ sender: AnyObject) {
        if(FWradioEmail.currentImage==#imageLiteral(resourceName: "selected"))
        {
        performSegue(withIdentifier: "SgueVerifyMailVC", sender: nil)
        }
        else{
             performSegue(withIdentifier: "SgueVerifyMagicVC", sender: nil)
        }
        
      
        
        
        
    }
    
        


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
