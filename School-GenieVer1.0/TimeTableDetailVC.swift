//
//  TimeTableDetailVC.swift
//  ParentViewStar
//
//  Created by Mac on 23/11/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import UIKit

class TimeTableDetailVC: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var timeTableDate: UILabel!
    @IBOutlet weak var timeTableTitle: UILabel!
    @IBOutlet weak var TtCollectionView: UICollectionView!
    @IBOutlet weak var timetableDescription: UILabel!
    
    fileprivate var _timeTableModel: TimeTable!
    @IBOutlet weak var topView: UIView!
    
    var timeTablemodel: TimeTable
        {
        
        get{
            return _timeTableModel
        }
        set
        {
            _timeTableModel = newValue
        }
    }
    
    var myImages=[String]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let m=self.topView.bounds
        var m2=CGRect()
        m2.size.height=m.size.height

        
        if(_timeTableModel.timeTableAttachment)
        {
            
            
            myImages = _timeTableModel.timeTableAttachmentUrl.components(separatedBy: "@@@")
            for index in 0...(myImages.count - 1){
                let temp = myImages[index]
                let imagedownload = DownloadImage()
                let profileimage = imagedownload.userImage(imageurlString: temp)
            }
            TtCollectionView.dataSource = self
            TtCollectionView.delegate = self
            
            TtCollectionView.reloadData()
        }
        
        print(myImages.count)

        timeTableDate.text = _timeTableModel.timeTableDate
        timeTableTitle.text = _timeTableModel.timeTableTitle
       // timeTableGivenby.text = _timeTableModel.timeTableGivenby
        timetableDescription.text = _timeTableModel.timeTableDesc
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myImages.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "TimeTableCell", for: indexPath as IndexPath) as? TimeTableColViewCell {
            
            cell.imgtimetable.loadGif(name: "ring-alt")
            cell.imgtimetable.startAnimating()
            
            let temp = self.myImages[indexPath.row]
            let imagedownload = DownloadImage()
            imagedownload.setImage(imageurlString: temp, imageView: cell.imgtimetable)
                       return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SelectMessageCenterListVC
        {
            if let thread1 = sender as? LastMsgDtls{
                destination.threadModel = thread1
            }
            
        }
    }
    


}
