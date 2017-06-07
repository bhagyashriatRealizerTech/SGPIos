//
//  ForgotPwdVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 31/10/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class ForgotPwdVC: UIViewController, UITableViewDataSource {

    @IBOutlet var forgotV: UIView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
    }
    
  
     var loginTextField: UITextField?
    @IBOutlet weak var imageButton: UIButton!
    @IBAction func imagetest(_ sender: AnyObject) {
   if(imageButton.currentImage == #imageLiteral(resourceName: "selected.jpg"))
   {
    imageButton.setImage(#imageLiteral(resourceName: "unselect"), for:UIControlState.normal)
        }
        else
   {
      imageButton.setImage(#imageLiteral(resourceName: "selected.jpg"), for:UIControlState.normal)
    
   if(imageButton.currentImage == #imageLiteral(resourceName: "selected.jpg"))
     {
     let emailBtn = UIAlertController(title: "email", message: "EmailId", preferredStyle: .alert )
     let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
     
     let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
     
     // ForgotBtnController.view.addSubview(ForgotPwdVC.UIView)
    emailBtn.addAction(cancelAction)
    emailBtn.addAction(okAction)
       
     emailBtn.addTextField(configurationHandler: {(textField) -> Void in
     // Enter the textfiled customization code here.
     self.loginTextField = textField
     self.loginTextField?.placeholder = "Enter your login ID"     })
     
            
     //ForgotBtnController.view.addSubview(ForgotPwdVC)
     present(emailBtn, animated: true, completion: {  })
}
    }
     }
    
    
    
    @IBOutlet weak var PopupContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad();
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
