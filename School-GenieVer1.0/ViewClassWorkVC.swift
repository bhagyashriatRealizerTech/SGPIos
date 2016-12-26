//
//  ViewClassWorkVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 10/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class ViewClassWorkVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var menu: UIBarButtonItem!

   
    private var   _cwDtls:ClassWork!
    @IBOutlet weak var mainview: UIView!
    
    var CWDtls : ClassWork
        {
        get{
            return _cwDtls
        }
       set
       {
        _cwDtls = newValue
        }
    }

    @IBOutlet var CWmainview: UIView!
    @IBOutlet weak var imagelistview: UIView!
    @IBOutlet weak var lblSubjectText: UILabel!
    
    @IBOutlet weak var lblCWDate: UILabel!
    
    
    @IBOutlet weak var ViewCWInfo: UIView!
    @IBOutlet weak var lblSubject: UILabel!
    
    @IBOutlet weak var cwcollectionView: UICollectionView!
    let reuseIdentifier = "cell"
    
    var myImages=[String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        //mainview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        //CWmainview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        let m=self.ViewCWInfo.bounds
        var m2=CGRect()
        m2.size.height=m.size.height
           
     lblSubjectText.text = CWDtls.subjectText
     lblSubject.text = CWDtls.subject
     lblCWDate.text = CWDtls.cwDate
        
        if(CWDtls.attachmentExists){
            cwcollectionView.dataSource = self
            cwcollectionView.delegate = self
        myImages = CWDtls.attachimage.components(separatedBy: "@@@")
            
            for index in 0...(myImages.count - 1){
                let temp = myImages[index]
                let imagedownload = DownloadImage()
                
                let profileimage = imagedownload.userImage(imageurlString: temp)
        }
        
        cwcollectionView.reloadData()
      
       }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myImages.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellCW", for: indexPath as IndexPath) as? Classworkimagecell{
        
           
            
        let temp = self.myImages[indexPath.row]
        let imagedownload = DownloadImage()
        
            imagedownload.setImage(imageurlString: temp, imageView: cell.imgclasswork)
       
            
        return cell
    }
    else{
    return UICollectionViewCell()
    }
  }


}
