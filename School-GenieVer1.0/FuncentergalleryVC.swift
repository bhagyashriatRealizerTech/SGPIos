//
//  FuncentergalleryVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 23/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class FuncentergalleryVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet var funview: UIView!

    @IBOutlet var funcentergalleryview: UIView!
    @IBOutlet weak var fungallerycollectionView: UICollectionView!
    
    
    @IBOutlet weak var viewfun: UIView!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = [String]()
    var images = [String]()
    var eventIds = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewfun.isHidden=true
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
       // funview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        var imageView = UIImageView()
    //    let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        imageView.isUserInteractionEnabled = true
        //imageView.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
        let eventmthod = FunCenterEventMethods()
        var eventlist = [FunCenterEventModel]()
        eventlist = eventmthod.getFunCenterEvent()
        if(eventlist.count > 0){
        for index in 0...(eventlist.count - 1){
            images.append(eventlist[index].ThumbNailPath!)
            items.append(eventlist[index].Event!)
            eventIds.append(eventlist[index].EventId!)
          }
        }
        else{
            viewfun.isHidden=false
            fungallerycollectionView.isHidden=true
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectioncell
        cell.lblevents.text=items[indexPath.item]
        
        
        let imagedownload = DownloadImage()
        let temp = images[indexPath.row]
       // let profileimage = imagedownload.userImage(imageurlString: temp)
        imagedownload.setImage(imageurlString: temp, imageView: cell.imggallery)
        
        /*if(profileimage != nil){
            cell.imggallery.image = profileimage
            //cell.updateCell(url: temp)
            
        }*/
               
        return cell
    }
    // MARK: - UICollectionViewDataSource protocol
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        let eventid:String = eventIds[indexPath.row]
        let fe = FunCenterEventModel()
        fe.setEvents(createTs: "", event: "", eventdate: "", eventId: eventid, thumbnailImage: "", thumbnailPath: "")
        
              performSegue(withIdentifier: "Sguefuncenter  ", sender: fe)
        
            }
    
    
  /*  func imageTapped(img: AnyObject)
    {
        performSegue(withIdentifier: "Sguefuncenter  ", sender: nil)

    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GallaryView
        {
            if let HW = sender as? FunCenterEventModel{
                
                let eventid:String = HW.EventId!

                HW.EventId =  eventid
                destination.HWDtls = HW
                
                
            }
        }
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
