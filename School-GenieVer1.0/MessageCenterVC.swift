//
//  SelectTeacherTestVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 18/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class MessageCenterVC: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var textviewmsg: UITextView!
    @IBOutlet weak var selectteacherbtn: UIButton!
    @IBOutlet weak var selectTecherpicker: UIPickerView!
    let teacher=["Neha Patil","Ani Mehera","Pratiksha Mahajan"]
    @IBAction func selectteacherclick(_ sender: AnyObject) {
        
        selectTecherpicker.isHidden=false
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textviewmsg.layer.borderColor=UIColor.black.cgColor
        textviewmsg.layer.borderWidth=1
        selectTecherpicker.dataSource=self
        selectTecherpicker.delegate=self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teacher[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectteacherbtn.setTitle(teacher[row], for: UIControlState())
        selectTecherpicker.isHidden=true
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let  myView = UIView(frame: CGRect(x: 0, y: 0, width:pickerView.bounds.width-30 ,height: 10))
        let img = ["flower.jpg"]
        let imgview:UIImageView = UIImageView(frame:CGRect(x: 0, y: 10, width: 30, height: 30))
        let myImage:UIImage=UIImage(named:"flower.jpg")!
        imgview.layer.cornerRadius=15
        imgview.clipsToBounds=true
        imgview.layer.masksToBounds=false
        
        var rowString = String()
        
        switch row {
        case 0:
            rowString="Neha Patil"
            imgview.image = myImage
            
        case 1:
            rowString = "Ani Mehera"
            imgview.image = myImage
        case  2:
            rowString = "Patiksha Mahajan"
            imgview.image = myImage
        case 2: break
        default:
            
            imgview.image = nil
            //return imgview
        }
        
        let myLabel=UILabel(frame:(CGRect(x:100, y: 10, width: 200, height: 50)))
        
        
        myLabel.text = rowString
        
        myView.addSubview(myLabel)
        
        myView.addSubview(imgview)
        return myView
    }
    
}
