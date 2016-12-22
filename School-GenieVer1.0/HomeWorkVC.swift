//
//  HomeWorkVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 16/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class HomeWorkVC: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var menu: UIBarButtonItem!

    
    @IBOutlet var homeview: UIView!
    @IBOutlet weak var HWTableView: UITableView!
    @IBOutlet weak var hWdatePicker: UIDatePicker!
    var HomeWorkArr=[HomeWork]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.setNeedsStatusBarAppearanceUpdate()
    
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        var d=(NSDate() as Date)-7 as Date
          
         hWdatePicker.setValue(1, forKeyPath: "alpha")
        hWdatePicker.minimumDate=(NSDate() as Date)-7 as Date
      // hWdatePicker.maximumDate=NSDate(timeInterval: (7*24*60*60), since: NSDate() as Date)as Date
        hWdatePicker.maximumDate=NSDate() as Date
        //hWdatePicker.minimumDate=Date(timeIntervalSinceNow: -7*24*60*60)
        
        
        
        let hwmethod = HomeworkMethods()
        HomeWorkArr = hwmethod.getHomework()
        
        if(HomeWorkArr.count > 0){
        HWTableView.dataSource=self
        HWTableView.delegate=self
        }
        // Do any additional setup after loading the view.
        
        
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.default;
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewHomeWorkVC
        {
            if let HW = sender as? HomeWork{
              /*  let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMM yyyy"
                let dateString = dateFormatter.string(from: hWdatePicker.date)
                HW.hwDate =  dateString*/
                destination.HWDtls = HW
                
               
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selected")
        
        let hms=HomeWorkArr[indexPath.row]
        performSegue(withIdentifier: "SegueViewHomeWork", sender: hms)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  HomeWorkArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell=tableView.dequeueReusableCell(withIdentifier: "CellHomeWork", for:indexPath) as? CellHomeWork
            
        {
            let homework=HomeWorkArr[indexPath.row]
            var subText = ""
            
            
            let myNSString =  homework.subjectText as NSString
            if(myNSString.length > 55)
            {
                subText =    myNSString.substring(with: NSRange(location: 0, length: 54))
                subText = subText.appending("...")
            }
            else
            {
                subText = homework.subjectText
            }
            
            cell.updateCell(SubjectText: subText, Subject: homework.subject,isAttachment: homework.attachmentExists)
            return cell
            
        }
            
        else{
            
            return UITableViewCell()
            
        }
        


    
}
}
