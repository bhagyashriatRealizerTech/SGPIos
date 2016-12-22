//
//  MYPupilVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 26/10/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class MYPupilVC: UIViewController {

    @IBOutlet weak var MypupilBB: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle=UIBarStyle.black
        self.navigationController?.navigationBar.barTintColor=UIColor(red:36/255,green:73/255,blue:210/255,alpha:1.0)
        
        self.navigationController?.navigationBar.tintColor=UIColor.white
        
        MyPupilBB.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Avenir", size: 20)!], for: UIControlState.normal)

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
