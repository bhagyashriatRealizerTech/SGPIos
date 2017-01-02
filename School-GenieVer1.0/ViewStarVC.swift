//
//  ViewStarVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 29/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire

class ViewStarVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var lblheader: UILabel!
    @IBOutlet weak var viewhide: UIView!
    @IBOutlet weak var headerview: UIView!
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var subjectPicker: UIPickerView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet var timeview: UIView!
    
    @IBOutlet weak var starTableView: UITableView!
    
    @IBOutlet weak var teacherinfoview: UIView!
    let sub = ["English","Math","Science","History","Marathi","Hindi"]
    
    var viewstars = [ViewStarModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewhide.isHidden=true
        
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
       timeview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        subjectPicker.dataSource = self
        subjectPicker.delegate = self
        starTableView.delegate = self
        starTableView.dataSource = self
        
        teacherinfoview.layer.borderWidth = 2.0
        teacherinfoview.layer.borderColor = UIColor.orange.cgColor
        
        
        let s1 = ViewStarModel(starDate:"18 Nov 2016" , starComment:"Good Work!!", starImageUrl:"test")
        viewstars.append(s1)
        
        let s2 = ViewStarModel(starDate : "17 Nov 2016" , starComment: "Great", starImageUrl: "test")
        viewstars.append(s2)
        
        let s3 = ViewStarModel(starDate: "16 Nov 2016", starComment: "Well Done", starImageUrl: "dfghj")
        viewstars.append(s3)
        
        let s4 = ViewStarModel(starDate: "15 Nov 2016" , starComment: "very good", starImageUrl: "test")
        viewstars.append(s4)
        
        let s5 = ViewStarModel(starDate: "14 Nov 2016" , starComment: "Nice work", starImageUrl: "test")
        viewstars.append(s5)
        
        //else 
        
        
    /*    lblheader.isHidden=true
        starTableView.isHidden=true
        subjectPicker.isHidden=true
        headerview.isHidden=true
        img.isHidden=true
        teacherinfoview.isHidden=true
        viewhide.isHidden=false
         
         
         
         
        */
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sub.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sub[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        //TODO: Retrive data related to selected subject
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Avenir", size: 17)//UIFont.boldSystemFontOfSize(17)//Font you want here
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = sub[row]
        return titleLabel
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = starTableView.dequeueReusableCell(withIdentifier: "ViewStarCell",for: indexPath) as? ViewStarCell{
            
            let viewStar = viewstars[(indexPath as NSIndexPath).row]
            
            cell.updateUI(viewStar)
            
            return cell
            
        }
        else
        {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewstars.count
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
