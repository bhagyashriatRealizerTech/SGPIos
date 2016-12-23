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
    var teacher=[String]()
    var teacherId=[String]()
    var teacherImage=[String]()
    var suballocation = [SubjectAllocation]()
    var selectedteacher = String()
    @IBAction func selectteacherclick(_ sender: AnyObject) {
        
        selectTecherpicker.isHidden=false
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textviewmsg.layer.borderColor=UIColor.black.cgColor
        textviewmsg.layer.borderWidth=1
        
        let suballocationmethod = SubjectAllocationMethods()
        suballocation = suballocationmethod.getAllTeacher()
        
        if(suballocation.count > 0){
            
            for index in 0...(suballocation.count - 1){
                if(!suballocation[index].TeacherName?.isEmpty){
                teacher.append(suballocation[index].TeacherName)
                teacherId.append(suballocation[index].TeacherUserId)
                teacherImage.append(suballocation[index].ThumbNailURL)
                }
            }
            
            if(teacher.count > 0){
                selectTecherpicker.dataSource=self
                selectTecherpicker.delegate=self
            }
        }
        
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
        return teacher.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teacher[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectteacherbtn.setTitle(teacher[row], for: UIControlState())
        selectTecherpicker.isHidden=true
        selectedteacher = teacherId[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let  myView = UIView(frame: CGRect(x: 0, y: 0, width:pickerView.bounds.width-30 ,height: 10))
        
        
        let imgview:UIImageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        
        //let myImage:UIImage=UIImage(named:"flower.jpg")!
        imgview.layer.cornerRadius=15
        imgview.clipsToBounds=true
        imgview.layer.masksToBounds=false
        imgview.layer.borderColor = UIColor.gray.cgColor
        
        var rowString = String()
        rowString = teacher[row]
        
        let imagedownload = DownloadImage()
        let temp = teacherImage[row]
        imagedownload.setImage(imageurlString: temp, imageView: imgview)
        
        
        let myLabel=UILabel(frame:(CGRect(x:100, y: 0, width: 200, height: 50)))
        
        
        myLabel.text = rowString
        
        myView.addSubview(myLabel)
        
        myView.addSubview(imgview)
        return myView
    }
    
    
    
}
