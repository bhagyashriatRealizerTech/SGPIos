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
    
    @IBOutlet weak var teacherPic: UIImageView!
    
    @IBOutlet weak var teacherName: UILabel!
    var sub = [String]()
    
    var viewstars = [StarModels]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewhide.isHidden=true
        
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        timeview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)),name:NSNotification.Name(rawValue: "load"), object: nil)
        
        
        
        teacherinfoview.layer.borderWidth = 2.0
        teacherinfoview.layer.borderColor = UIColor.gray.cgColor
        

        let submethods = SubjectAllocationMethods()
        sub = submethods.getAllSubjects()
        
        if(sub.count > 0){
            subjectPicker.dataSource = self
            subjectPicker.delegate = self
            let starmethods = ViewStarMethods()
            viewstars.removeAll()
            viewstars = starmethods.getStars(subject: sub[0])
            
            if(viewstars.count > 0){
                starTableView.dataSource = self
                starTableView.delegate = self
                starTableView.reloadData()
                
                dispalyTable()
                
                teacherName.text = viewstars[0].TeacherName
                var picurl = viewstars[0].TeacherLoginId
                if(picurl != nil){
                    picurl = ""
                }
                setPic(picurl: picurl!)

            }
            else{
                hideTable()
            }
        }
        else{
            lblheader.isHidden=true
            starTableView.isHidden=true
            subjectPicker.isHidden=true
            headerview.isHidden=true
            img.isHidden=true
            teacherinfoview.isHidden=true
            viewhide.isHidden=false

        }
        
    }
    func dispalyTable(){
        lblheader.isHidden=false
        starTableView.isHidden=false
        subjectPicker.isHidden=false
        headerview.isHidden=false
        img.isHidden=false
        teacherinfoview.isHidden=false
        viewhide.isHidden=true
        teacherPic.isHidden = false
        teacherName.isHidden = false

    }
    
    func hideTable(){
        lblheader.isHidden=true
        starTableView.isHidden=true
        subjectPicker.isHidden=true
        headerview.isHidden=true
        img.isHidden=true
        teacherinfoview.isHidden=true
        viewhide.isHidden=false
        teacherPic.isHidden = true
        teacherName.isHidden = true

    }

    
    func loadList(notification: NSNotification){
        //load data here
        let starmethods = ViewStarMethods()
        viewstars.removeAll()
        viewstars = starmethods.getStars(subject: sub[0])
        
        if(viewstars.count > 0){
            starTableView.dataSource = self
            starTableView.delegate = self
            starTableView.reloadData()
            
            dispalyTable()
            teacherName.text = viewstars[0].TeacherName
            var picurl = viewstars[0].TeacherLoginId
            
            if(picurl != nil){
                picurl = ""
            }
            setPic(picurl: picurl!)

        }
        else{
            hideTable()
        }

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
        
        let starmethods = ViewStarMethods()
        viewstars.removeAll()
        viewstars = starmethods.getStars(subject: sub[row])
        
        if(viewstars.count > 0){
            starTableView.dataSource = self
            starTableView.delegate = self
            starTableView.reloadData()
            
            dispalyTable()
            teacherName.text = viewstars[0].TeacherName
            var picurl = viewstars[0].TeacherLoginId
            
            if(picurl != nil){
                picurl = ""
            }
            setPic(picurl: picurl!)
            
                    }
        else{
            hideTable()
        }

        
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
    
    func setPic(picurl:String) {
        let v=teacherName.text
        let stArr = v?.components(separatedBy: " ")
        var st=""
        for s in stArr!{
            if let str=s.characters.first{
                st+=String(str).capitalized
            }
        }
        
        let img1 = ImageToText()
        let tempimg = img1.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
        self.teacherPic.layer.borderColor = UIColor.gray.cgColor
        self.teacherPic.layer.cornerRadius = 36.6
        self.teacherPic.layer.masksToBounds = true
        self.teacherPic.image = tempimg
        
        /* if(picurl != nil){
         if(picurl?.isEmpty)!{
         let img1 = ImageToText()
         let tempimg = img1.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
         self.teacherPic.layer.borderColor = UIColor.gray.cgColor
         self.teacherPic.layer.cornerRadius = 28.7
         self.teacherPic.layer.masksToBounds = true
         self.teacherPic.image = tempimg
         
         }
         else{
         let imagedownload = DownloadImage()
         imagedownload.setImage(imageurlString: picurl!, imageView: teacherPic)
         }
         }
         else{
         
         let img1 = ImageToText()
         let tempimg = img1.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
         self.teacherPic.layer.borderColor = UIColor.gray.cgColor
         self.teacherPic.layer.cornerRadius = 25.7
         self.teacherPic.layer.masksToBounds = true
         self.teacherPic.image = tempimg
         
         
         
         
         }*/

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
