//
//  HolidayVC1.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 27/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class HolidayVC1: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var holidayview: UIView!
    @IBOutlet weak var menu: UIBarButtonItem!
    var holydayArr=[PublicHoliday]()
    @IBOutlet weak var holydayview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        holidayview.isHidden=true
        
        let holidaymethod = PublicHolidayMethods()
        holydayArr = holidaymethod.getPublicHoliday()
        
        if(holydayArr.count > 0){
        holydayview.dataSource=self
        holydayview.delegate=self
        }
 
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
            let holiday=holydayArr[indexPath.row]
            let dateformater = DateFormatter()
            dateformater.dateStyle = .medium
            dateformater.timeStyle = .none
            
            let startDate = Date(jsonDate: holiday.PHStartDate!)
            let startDateStr = dateformater.string(from: startDate!)
            
            let endDate = Date(jsonDate: holiday.PHEndDate!)
            let endDateStr = dateformater.string(from: endDate!)
                       
            cell.updateCell(holiday: holiday.Holiday!, fromdate: startDateStr, attachmentExists: false, attachimage: "", todate: endDateStr)
           
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
