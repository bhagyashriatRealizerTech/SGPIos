//
//  ShowAlertsVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 26/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class ShowAlertsVC: UIViewController {

    @IBOutlet weak var lblmsg: UILabel!
    @IBOutlet weak var lblteachername: UILabel!
    @IBOutlet weak var ldldate: UILabel!
    @IBOutlet weak var lblcategory: UILabel!
    private var   _aldts:Alerts!
    
        var ALDtls : Alerts
        {
        get{
            return _aldts
        }
        set
        {
            _aldts = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let alertcell = AlertCell()
        lblcategory.text=alertcell.getCategory(initials: ALDtls.category)
        
        
        lblmsg.text=ALDtls.msgText
        lblteachername.text="Aparna Patil"
        ldldate.text=ALDtls.aldate
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
