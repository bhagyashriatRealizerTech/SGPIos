//
//  ViewHomeWorkVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 16/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftGifOrigin

class ViewHomeWorkVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var LblSubjectText: UILabel!
    private var   _hwDtls:HomeWork!
    var HWDtls : HomeWork
        {
        get{
            return _hwDtls
        }
        set
        {
            _hwDtls = newValue
        }
    }

    @IBOutlet var HWmainView: UIView!
    @IBOutlet weak var imagelistview: UIView!
   
    @IBOutlet weak var HWViewInfo: UIView!
  
    @IBOutlet weak var HWlblDate: UILabel!
    
    
    @IBOutlet weak var lblSubject: UILabel!
    
    
    
    @IBOutlet weak var hwcollectionview: UICollectionView!
    var myImages=[String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        let m=self.HWViewInfo.bounds
        var m2=CGRect()
        m2.size.height=m.size.height
        
        if(HWDtls.attachmentExists)
        {
            hwcollectionview.dataSource = self
            hwcollectionview.delegate = self
            
            myImages = HWDtls.attachimage.components(separatedBy: "@@@")
            for index in 0...(myImages.count - 1){
                let temp = myImages[index]
                let imagedownload = DownloadImage()
                let profileimage = imagedownload.userImage(imageurlString: temp)
            }

            hwcollectionview.reloadData()
        }
        
        print(myImages.count)
        
           }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
       // let bounds = UIScreen.main.bounds
       //  let width = bounds.size.width
        
        LblSubjectText.text=HWDtls.subjectText
        
        lblSubject.text = HWDtls.subject
        
        HWlblDate.text = HWDtls.hwDate
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myImages.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellHW", for: indexPath as IndexPath) as? Homeworkcollectioncell {
            
            //let gifimage = UIImage.gif(name: "default")
            //cell.imghomework.image = #imageLiteral(resourceName: "default.gif")
            cell.imghomework.loadGif(name: "ring-alt")
            cell.imghomework.startAnimating()
       let temp = self.myImages[indexPath.row]
       let imagedownload = DownloadImage()
            imagedownload.setImage(imageurlString: temp, imageView: cell.imghomework)
            
        
       /* let profileimage = imagedownload.userImage(imageurlString: temp)
        
        if(profileimage != nil){
        cell.imghomework.image = profileimage
            cell.updateCell(url: temp)
            
           }*/
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
    
}
