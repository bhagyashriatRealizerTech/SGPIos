//
//  MyPupiScreenlVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 30/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class MyPupiScreenlVC: UIViewController {

    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet var pupilview: UIView!
    
    
    @IBOutlet weak var studentimage: UIImageView!
    @IBOutlet weak var pupilName: UIStackView!
    @IBOutlet weak var stdDiv: UIStackView!
    
    @IBOutlet weak var studentStdDiv: UILabel!
    
    @IBOutlet weak var studentName: UILabel!
    
    @IBOutlet weak var studentDob: UILabel!
    
    @IBOutlet weak var studentHobbies: UILabel!
    
    @IBOutlet weak var studentRollno: UILabel!
    
    @IBOutlet weak var studentEmergencyNo: UILabel!
    
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var studentContactNo: UILabel!
    
    @IBOutlet weak var studentbloodGroup: UILabel!
    @IBOutlet weak var studentAddress: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        pupilview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        

        // Do any additional setup after loading the view.
        setValues()
        
            }
    
    func setValues()
    {
        let pupildetail = PupilInformationMethods()
        let pupilInfo:StudentDetail = pupildetail.getStudentDetail()
        let dobirth = Date(jsonDate: pupilInfo.dob!)
        let dateformater = DateFormatter()
        dateformater.dateStyle = .medium
        dateformater.timeStyle = .none
        let datestr = dateformater.string(from: dobirth!)
        self.studentName.text = pupilInfo.fName!+" "+pupilInfo.lName!
        self.studentStdDiv.text = pupilInfo.std!+"  "+pupilInfo.division!
        self.studentRollno.text =  "\(pupilInfo.classRollNo!)"
        self.studentDob.text = datestr
        self.studentAddress.text = pupilInfo.address
        self.studentHobbies.text = pupilInfo.hobbies
        self.studentbloodGroup.text = pupilInfo.bldGrp
        self.studentContactNo.text = pupilInfo.contactNo
        self.studentEmergencyNo.text = pupilInfo.emergencyContactNo
        self.teacherName.text = " - "
        
        
        
        let v=studentName.text
        let stArr = v?.components(separatedBy: " ")
        var st=""
        for s in stArr!{
            if let      str=s.characters.first{
                st+=String(str).capitalized
            }
        }
        
        if(pupilInfo.ThumbnailURL?.isEmpty)!
        {
            let img = ImageToText()
            let tempimg = img.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
            /*senderimage.layer.borderColor = UIColor.gray.cgColor
            senderimage.layer.cornerRadius = 25.7
            senderimage.layer.masksToBounds = true*/
            self.studentimage.image = tempimg
            
        }
        else{
            
            let imagedownload = DownloadImage()
            
            let profileimage = imagedownload.userImage(imageurlString: pupilInfo.ThumbnailURL!)
            if(profileimage != nil)
            {
                /*senderimage.layer.borderColor = UIColor.gray.cgColor
                senderimage.layer.cornerRadius = 25.7
                senderimage.layer.masksToBounds = true*/
                self.studentimage.image = profileimage
            }
            else
            {
                let img = ImageToText()
                let tempimg = img.textToImage(drawText: st as NSString, inImage: #imageLiteral(resourceName: "greybg"), atPoint: CGPoint(x: 20.0, y: 20.0))
                self.studentimage.layer.borderColor = UIColor.gray.cgColor
                /*senderimage.layer.cornerRadius = 25.7
                senderimage.layer.masksToBounds = true*/
                self.studentimage.image = tempimg
                
            }
            
        }
        
    

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
