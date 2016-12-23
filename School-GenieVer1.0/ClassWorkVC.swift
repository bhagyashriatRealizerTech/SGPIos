//
//  ClassWorkVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 09/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire


class ClassWorkVC : UIViewController,UITableViewDataSource,UITableViewDelegate {
    
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
        
        
        self.navigationController?.isNavigationBarHidden=false;
        

        
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        //classworkview.addGestureRecognizer(revealViewController().panGestureRecognizer())
               
        
      datepickercontrol.minimumDate=NSDate() as Date
        datepickercontrol.maximumDate=NSDate()  as Date
        
        
              /*  let c1=ClassWork(subject:"Math",subjectText:"calcutalions for first Standard need to be done today itsel" ,attachmentExists:true,attachimage:"car.jpg ")
        
        let c2=ClassWork(subject:"English",subjectText:"Please revise grammer and learn A to Z",attachmentExists:true,attachimage:" ")
        
        let c3=ClassWork(subject:"Hindi",subjectText:"Please sing a song in Hindi",attachmentExists:false,attachimage:" ")
        
        
        let c4=ClassWork(subject:"Science",subjectText:"Please do a project for cutting frog and determine the species and cells",attachmentExists:true,attachimage:" ")
        
        ClassWorkArr.append(c1)
        ClassWorkArr.append(c2)
        ClassWorkArr.append(c3)
        ClassWorkArr.append(c4)*/
        
        let classworkmethod = ClassworkMethods()
        ClassWorkArr = classworkmethod.getClasswork()
        
        if(ClassWorkArr.count > 0){
        
        tblClassWork.dataSource=self
        tblClassWork.delegate=self
        }

        
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
