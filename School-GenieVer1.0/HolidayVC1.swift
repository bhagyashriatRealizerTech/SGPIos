//
//  HolidayVC1.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 27/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class HolidayVC1: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var menu: UIBarButtonItem!
    var holydayArr=[Holiday]()
    @IBOutlet weak var holydayview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
          let c1=Holiday(holiday: "Diwali", fromDate: "30 Oct", attachmentExists: true, attachimage: "", toDate: "4 Nov")
            //ClassWork(subject:"Math",subjectText:"calcutalions for first Standard need to be done today itsel" ,attachmentExists:true,attachimage:"car.jpg ")
         
        
         
       holydayArr.append(c1)
        holydayview.dataSource=self
        holydayview.delegate=self
 
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holydayArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "holidaycell", for:indexPath) as? holidaycell
            
        {
            let classwork=holydayArr[indexPath.row]
            var subText = ""
            
            
           // let myNSString =  classwork.subjectText as NSString
            /*if(myNSString.length > 55)
            {
                subText =    myNSString.substring(with: NSRange(location: 0, length: 54))
                subText = subText.appending("...")
            }
            else
            {
                subText = classwork.subjectText
            }*/
            
            cell.updateCell(holiday: "Diwali", fromdate: "30 Oct", attachmentExists: true, attachimage: "", todate: "4 Nov")
           // cell.updateCell(SubjectText: subText, Subject: classwork.subject,isAttachment: classwork.attachmentExists)
            return cell
            
        }
            
        else{
            
            return UITableViewCell()
            
        }
        
        

    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
