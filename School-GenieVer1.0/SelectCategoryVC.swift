//
//  SelectCategoryVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 26/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class SelectCategoryVC: UIViewController {

    @IBAction func lbldoneclick(_ sender: AnyObject) {
        
        if(btnculturalActivity.currentImage==#imageLiteral(resourceName: "unselect") &&
        btnFDC.currentImage==#imageLiteral(resourceName: "unselect") && btnSportsDay.currentImage==#imageLiteral(resourceName: "unselect") && btnclassmeeting.currentImage==#imageLiteral(resourceName: "unselect") && btnothers.currentImage==#imageLiteral(resourceName: "unselect"))
        {
            let check = UIAlertController(title: "Category Selection", message: "Please Select Any one Category", preferredStyle: .alert )
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler:nil)
            
            
           check.addAction(okAction)
            
            present(check, animated: true, completion: {  })
            

        }
 else  if(txtmsg.text=="")
        {
            let msg = UIAlertController(title: "Message", message: "Please Enter Message", preferredStyle: .alert )
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler:nil)
            
            
           msg.addAction(okAction)
            
            present(msg, animated: true, completion: {  })
            

        }
    else  if((btnFDC.currentImage==#imageLiteral(resourceName: "selected") || btnclassmeeting.currentImage==#imageLiteral(resourceName: "selected") || btnculturalActivity.currentImage==#imageLiteral(resourceName: "selected") || btnSportsDay.currentImage==#imageLiteral(resourceName: "selected") || btnothers.currentImage==#imageLiteral(resourceName: "selected") ) && (txtmsg.text != "")){
            performSegue(withIdentifier: "SqueDone", sender: nil)
        }
        
        
        
        
    }
    @IBOutlet weak var btnFDC: UIButton!
    @IBOutlet weak var btnothers: UIButton!
    @IBOutlet weak var btnSportsDay: UIButton!
    @IBOutlet weak var btnclassmeeting: UIButton!
    @IBOutlet weak var btnculturalActivity: UIButton!
    @IBOutlet weak var txtmsg: UITextView!
    @IBOutlet weak var viewradiolable: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtmsg.layer.borderColor=UIColor.black.cgColor
        txtmsg.layer.borderWidth=1
     
     viewradiolable.layer.borderColor = UIColor(red:255/255.0, green:204/255.0, blue:102/255.0, alpha: 1.0).cgColor
        viewradiolable.layer.borderWidth=1
        
        
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(LoginVC.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        
        
    }
    
    func didTapView(){
        self.view.endEditing(true)
    }

    @IBAction func otherclick(_ sender: AnyObject) {
        if(btnothers.currentImage==#imageLiteral(resourceName: "selected"))
        {
            
            btnSportsDay.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnclassmeeting.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
           
            btnFDC.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnculturalActivity.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnothers.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
        }
        else{
            btnothers.setImage(#imageLiteral(resourceName: "selected"), for: UIControlState.normal)
            if (btnothers.currentImage==#imageLiteral(resourceName: "selected")){
                btnSportsDay.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                btnclassmeeting.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                
                btnFDC.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                btnculturalActivity.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                
            }
        }

        
        
        
    }

    @IBAction func btnclassmeeting(_ sender: AnyObject) {
        
        if(btnclassmeeting.currentImage==#imageLiteral(resourceName: "selected"))
        {
            
            btnculturalActivity.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
           
            btnothers.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            
            btnSportsDay.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnFDC.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
             btnclassmeeting.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
        }
        else {
           btnclassmeeting.setImage(#imageLiteral(resourceName: "selected"), for: UIControlState.normal)
            if(btnclassmeeting.currentImage==#imageLiteral(resourceName: "selected"))
            {
                
                btnculturalActivity.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
               btnFDC.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                btnothers.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                
                btnSportsDay.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                
            }
            
        }

    }
    @IBAction func FDCclick(_ sender: AnyObject) {
        
        if(btnFDC.currentImage==#imageLiteral(resourceName: "selected"))
        {
            
            btnculturalActivity.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnclassmeeting.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnothers.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
           
            btnSportsDay.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
             btnFDC.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
        }
        else{
            btnFDC.setImage(#imageLiteral(resourceName: "selected"), for: UIControlState.normal)
            if (btnFDC.currentImage==#imageLiteral(resourceName: "selected")){
                btnculturalActivity.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                btnclassmeeting.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                btnothers.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                
                btnSportsDay.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            }
        }
        

    }
    @IBAction func sportdayclick(_ sender: AnyObject) {
        if(btnSportsDay.currentImage==#imageLiteral(resourceName: "selected"))
        {
            
            btnculturalActivity.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnclassmeeting.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnothers.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnFDC.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnSportsDay.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
        }
        else{
            btnSportsDay.setImage(#imageLiteral(resourceName: "selected"), for: UIControlState.normal)
            if (btnSportsDay.currentImage == #imageLiteral(resourceName: "selected")  ){
                btnculturalActivity.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                btnclassmeeting.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                btnothers.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                
               btnFDC.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            }
        }

    }
    @IBOutlet weak var ClassmeetingClick: UIButton!
    @IBAction func culturalActivityclick(_ sender: AnyObject) {
        
        
        if(btnculturalActivity.currentImage==#imageLiteral(resourceName: "selected"))
        {
            
            btnSportsDay.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnclassmeeting.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnothers.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnFDC.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            btnculturalActivity.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
        }
        else{
            btnculturalActivity.setImage(#imageLiteral(resourceName: "selected"), for: UIControlState.normal)
            if (btnculturalActivity.currentImage==#imageLiteral(resourceName: "selected")){
                btnFDC.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                btnclassmeeting.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                btnothers.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
                
                btnSportsDay.setImage(#imageLiteral(resourceName: "unselect"), for: UIControlState.normal)
            }
        }
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
