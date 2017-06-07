//
//  ClassWorkVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 09/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire


class ClassWorkVC : UIViewController,UITableViewDataSource,UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var lblclass: UILabel!
    @IBOutlet weak var viewheader: UIView!
    @IBOutlet weak var lblheader: UILabel!
    @IBOutlet weak var classline: UIView!
    @IBOutlet weak var hwpicker: UIPickerView!
    @IBOutlet weak var viewhide: UIView!
    var dates:[String]=[]
    @IBOutlet var classworkview: UIView!
    @IBOutlet weak var menu:UIBarButtonItem!
    
    
    @IBOutlet weak var tblClassWork: UITableView!
    
    @IBOutlet weak var datepickercontrol: UIDatePicker!
    var ClassWorkArr=[ClassWork]()

    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewClassWorkVC
        {
            if let CW = sender as? ClassWork{
                
                var datestring:String = CW.cwDate
                var datefile = DateFile()
                datestring = datefile.getMediumDate(date: CW.cwDate.components(separatedBy: " ")[0])
                CW.cwDate =  datestring
                destination.CWDtls = CW
                
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selected")
        
        let cls=ClassWorkArr[indexPath.row]
        performSegue(withIdentifier: "SegueViewClassWork", sender: cls)
    }
    
    override func viewDidLoad() {
                super.viewDidLoad()
        viewhide.isHidden=true
        
        
        self.navigationController?.isNavigationBarHidden=false;
        

        
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        //classworkview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        
     // datepickercontrol.minimumDate=NSDate() as Date
       // datepickercontrol.maximumDate=NSDate()  as Date
        
        
              /*  let c1=ClassWork(subject:"Math",subjectText:"calcutalions for first Standard need to be done today itsel" ,attachmentExists:true,attachimage:"car.jpg ")
        
        let c2=ClassWork(subject:"English",subjectText:"Please revise grammer and learn A to Z",attachmentExists:true,attachimage:" ")
        
        let c3=ClassWork(subject:"Hindi",subjectText:"Please sing a song in Hindi",attachmentExists:false,attachimage:" ")
        
        
        let c4=ClassWork(subject:"Science",subjectText:"Please do a project for cutting frog and determine the species and cells",attachmentExists:true,attachimage:" ")
        
        ClassWorkArr.append(c1)
        ClassWorkArr.append(c2)
        ClassWorkArr.append(c3)
        ClassWorkArr.append(c4)*/
        
        let classworkmethod = ClassworkMethods()
       print( classworkmethod.getAllClassworkDate())
    //s=classworkmethod.getClassworkSubjectForDate(date: <#T##String#>)
        
        
        
    dates=classworkmethod.getAllClassworkDate()
        if(dates.count > 0){
            ClassWorkArr = classworkmethod.getClasswork(date: dates[0])
        }
        
        if(ClassWorkArr.count > 0){
            
            tblClassWork.dataSource=self
            tblClassWork.delegate=self
        }
        else{
            tblClassWork.isHidden=true
            viewhide.isHidden=false
            lblheader.isHidden=true
            lblclass.isHidden=true
            classline.isHidden=true
            viewheader.isHidden=true
            hwpicker.isHidden=true
        }
        
        hwpicker.dataSource=self
        hwpicker.delegate=self

        
    }
    func datePickerChanged(picker: UIDatePicker) {
        print(picker.date)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dates.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        var dtfm=DateFormatter()
        dtfm.dateFormat = "MM dd yyyy"
        let dateN =   dtfm.date(from:dates[row])
        // let d=dtfm.string(from: dateN!)
        
        return  dates[row]    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let cwmethod = ClassworkMethods()
        ClassWorkArr.removeAll()
        ClassWorkArr = cwmethod.getClasswork(date: dates[row])
        
        if(ClassWorkArr.count > 0){
            tblClassWork.reloadData()
            tblClassWork.dataSource=self
            tblClassWork.delegate=self
        }
        else
        {
            
        }

        
        //TODO: Retrive data related to selected subject
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Avenir", size: 17)//UIFont.boldSystemFontOfSize(17)//Font you want here
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = dates[row]
        return titleLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return  ClassWorkArr.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=false;
        

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
       if let cell=tableView.dequeueReusableCell(withIdentifier: "ClassWorkCell", for:indexPath) as? ClassWorkCell
        
        {
            let classwork=ClassWorkArr[indexPath.row]
            var subText = ""
            
           
            let myNSString =  classwork.subjectText as NSString
            if(myNSString.length > 55)
            {
            subText =    myNSString.substring(with: NSRange(location: 0, length: 54))
                subText = subText.appending("...")
            }
            else
            {
                subText = classwork.subjectText
            }
            
             cell.updateCell(SubjectText: subText, Subject: classwork.subject,isAttachment: classwork.attachmentExists)
            return cell
            
        }
        
        else{
        
        return UITableViewCell()
        
        }

        
    
    }
    
   
}
