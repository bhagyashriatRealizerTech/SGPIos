//
//  HomeWorkVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 16/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class HomeWorkVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource
{
    @IBOutlet weak var headerview: UIView!
    @IBOutlet weak var lblheader: UILabel!
    @IBOutlet weak var lblhomework: UILabel!
    @IBOutlet weak var viewhmhide: UIView!
    @IBOutlet weak var viewtable: UIView!
    @IBOutlet weak var menu: UIBarButtonItem!

    @IBOutlet weak var homeline: UIView!
    @IBOutlet weak var hwpicker: UIPickerView!
    
    @IBOutlet weak var viewhomehide: UIView!
    @IBOutlet var homeview: UIView!
    @IBOutlet weak var HWTableView: UITableView!
    @IBOutlet weak var hWdatePicker: UIDatePicker!
    var HomeWorkArr=[HomeWork]()
    var dates:[String]=[]
    var dateformat:[String]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        viewhmhide.isHidden=true
    self.setNeedsStatusBarAppearanceUpdate()
   // viewhmhide.isHidden=true
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        var d=(NSDate() as Date)-7 as Date
          
        // hWdatePicker.setValue(1, forKeyPath: "alpha")
        //hWdatePicker.minimumDate=(NSDate() as Date)-7 as Date
      // hWdatePicker.maximumDate=NSDate(timeInterval: (7*24*60*60), since: NSDate() as Date)as Date
        //hWdatePicker.maximumDate = dateN as Date
        //hWdatePicker.minimumDate=Date(timeIntervalSinceNow: -7*24*60*60)
        
        
        
        
        let hwmethod = HomeworkMethods()
        let d2 = hwmethod.getLastHomeworkDate()
        print(d2)
        
        let dtfm=DateFormatter()
        dtfm.dateFormat = "yyyy-MM-dd"
       // let dateN:Date =   dtfm.date(from: d2)!
       // let dateN0 = dtfm.string(from: dateN)
       // print(dateN)
        //print(dateN0)
        dates=hwmethod.getallLastHomeworkDate()
        hwpicker.dataSource=self
        hwpicker.delegate=self
        
        if(dates.count > 0){
        HomeWorkArr = hwmethod.getHomework(date: dates[0])
        }
        if(HomeWorkArr.count > 0){
        HWTableView.dataSource=self
        HWTableView.delegate=self
        }
        else{
            HWTableView.isHidden=true
            viewhmhide.isHidden=false
            
            hwpicker.isHidden=true
            lblheader.isHidden=true
            lblhomework.isHidden=true
            headerview.isHidden=true
            homeline.isHidden=true
            
        }
        // Do any additional setup after loading the view.
        
    
    
        
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
        
        return  dates[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let hwmethod = HomeworkMethods()
        HomeWorkArr.removeAll()
        HomeWorkArr = hwmethod.getHomework(date: dates[row])
        
        if(HomeWorkArr.count > 0){
            HWTableView.reloadData()
            HWTableView.dataSource=self
            HWTableView.delegate=self
        }
        else{
            HWTableView.isHidden=true
            viewtable.isHidden=false
            
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
            
                var datestring:String = HW.hwDate
                let datefile = DateFile()
                datestring = datefile.getMediumDate(date: HW.hwDate.components(separatedBy: " ")[0])
                HW.hwDate =  datestring
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
            
            var datestring:String = homework.hwDate
            let datefile = DateFile()
 datestring = datefile.getDate(date: homework.hwDate.components(separatedBy: " ")[0], FLAG: "D")

            
            cell.updateCell(SubjectText: subText, Subject: homework.subject,isAttachment: homework.attachmentExists)
            return cell
            
        }
            
        else{
            
            return UITableViewCell()
            
        }
        


    
}
}
