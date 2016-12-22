//
//  TimeTableVC.swift
//  ParentViewStar
//
//  Created by Mac on 23/11/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import UIKit

class TimeTableVC: UIViewController , UITableViewDelegate ,  UITableViewDataSource{
    
    @IBOutlet weak var timeTableList: UITableView!
    
    @IBOutlet weak var menu: UIBarButtonItem!
    var timeTable = [TimeTable]()
    
    @IBOutlet var Tview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
       Tview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        let timetablemethod = TimeTableMethods()
        timeTable = timetablemethod.getTimeTable()
        if(timeTable.count>0)
        {
        timeTableList.delegate = self
        timeTableList.dataSource = self
        }
        
      /*  let t1 = TimeTable(timetableGivenBy: "Bhagyashri Salgare", timeTableDate: "23 Nov 2016", timeTableTitle: "Exam Time Table - 1", timeTableAttachment: true)
        
        timeTable.append(t1)
        
        let t2 = TimeTable(timetableGivenBy: "Pravin Jadhav", timeTableDate: "22 Nov 2016", timeTableTitle: "Exam Time Table - 2", timeTableAttachment: true)
        
        timeTable.append(t2)
        
        
        let t3 = TimeTable(timetableGivenBy: "Farhan Bodale", timeTableDate: "21 Nov 2016", timeTableTitle: "Exam Time Table - 3", timeTableAttachment: true)
        
        timeTable.append(t3)
        
        let t4 = TimeTable(timetableGivenBy: "RamChandra Magar", timeTableDate: "20 Nov 2016", timeTableTitle: "Exam Time Table - 4", timeTableAttachment: true)
        
        timeTable.append(t4)
        
        let t5 = TimeTable(timetableGivenBy: "Satish Sawant", timeTableDate: "19 Nov 2016", timeTableTitle: "Exam Time Table - 5", timeTableAttachment: true)
        
        timeTable.append(t5)
        
        let t6 = TimeTable(timetableGivenBy: "Swapnali Shrawage", timeTableDate: "18 Nov 2016", timeTableTitle: "Exam Time Table - 6", timeTableAttachment: true)
        
        timeTable.append(t6)*/
        
        
        // Do any additional setup after loading the view.
    }
    
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = timeTableList.dequeueReusableCell(withIdentifier: "TimeTableCell",for: indexPath) as? TimeTableCell{
            
            let timeTable1 = timeTable[indexPath.row]
            
            var description = ""
            
            
            let myNSString =  timeTable1.timeTableDesc as NSString
            if(myNSString.length > 55)
            {
                description =    myNSString.substring(with: NSRange(location: 0, length: 54))
                description = description.appending("...")
            }
            else
            {
                description = timeTable1.timeTableDesc
            }
            
            timeTable1.timeTableDesc = description

            
            cell.updateUI(timeTable1)
            
            return cell
            
        }
        else
        {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeTable.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var t1 = timeTable[indexPath.row]
        let dateT = t1.timeTableDate.components(separatedBy: " ")[0]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "MM/dd/yyyy"

        let dateD = dateFormatter1.date(from: dateT)
        let date = dateFormatter.string(from: dateD!)
        t1 = TimeTable(timetableGivenBy: t1.timeTableGivenby, timeTableDate: date, timeTableTitle: t1.timeTableTitle, timeTableAttachment: t1.timeTableAttachment, timeTableDesc: t1.timeTableDesc, timeTableAttachmentUrl: t1.timeTableAttachmentUrl)
        
        performSegue(withIdentifier: "TimeTableDetailVC", sender: t1)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TimeTableDetailVC
        {
            if let timeTable1 = sender as? TimeTable{
                destination.timeTablemodel = timeTable1
            }
            
        }
    }
    
    
    
}
