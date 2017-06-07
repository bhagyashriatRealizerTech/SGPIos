//
//  LoginScreenVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 30/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class LoginScreenVC: UIViewController {

    @IBOutlet var viewsecond: UIView!
    @IBOutlet weak var menu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        viewsecond.addGestureRecognizer(revealViewController().panGestureRecognizer())
        //self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
