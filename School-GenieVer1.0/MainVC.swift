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

class MainVC : UIViewController , UITextFieldDelegate{
    @IBOutlet weak var menubar: UIBarButtonItem!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let storybord=UIStoryboard.init(name: "Main", bundle: nil)
        let sw=storybord.instantiateViewController(withIdentifier:"RevealViewController") as! SWRevealViewController
        
        
        self.view.window?.rootViewController=sw
        
        let des=self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        let nav=UINavigationController(rootViewController: des)
        sw.pushFrontViewController(nav, animated: true)
        
        menubar.target=self.revealViewController()
        
        menubar.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        self.navigationController?.isNavigationBarHidden=true;
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.default;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=true;  menubar.target=self.revealViewController()
        
        menubar.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        let storybord=UIStoryboard.init(name: "Main", bundle: nil)
        let sw=storybord.instantiateViewController(withIdentifier:"RevealViewController") as! SWRevealViewController
        
        
        self.view.window?.rootViewController=sw
        
        let des=self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        let nav=UINavigationController(rootViewController: des)
        sw.pushFrontViewController(nav, animated: true)
        self.navigationController?.isNavigationBarHidden=true;
        
        
        
         var islogged:Bool = false
         if(UserDefaults.standard.value(forKey: "IsLogin") != nil){
         islogged = UserDefaults.standard.value(forKey: "IsLogin") as! Bool
         }
         if(islogged){
         self.performSegue(withIdentifier: "dashbardseguemain", sender: nil)
         }
         else{
            
            
            self.performSegue(withIdentifier: "loginsegue", sender: nil)
        }
    }
}

