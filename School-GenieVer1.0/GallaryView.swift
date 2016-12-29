//
//  GallaryView.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 24/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class GallaryView: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet var fview: UIView!
    @IBOutlet weak var gallarycollectionview: UICollectionView!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = [String]()
    var images = [String]()
    //var img:UIImage=[UIImage]
    
    private var   _eventdtls:FunCenterEventModel!
    var HWDtls : FunCenterEventModel
        {
        get{
            return _eventdtls
        }
        set
        {
            _eventdtls = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        fview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        

        let imagemethods = FunCenterImageMethods()
        if(_eventdtls.EventId != nil){
        let imagesList = imagemethods.getFunCenterEventImage(eventId: _eventdtls.EventId!)
        if(imagesList.count > 0){
        for index in 0...(imagesList.count - 1){
            items.append(String(describing: imagesList[index].SrNo!))
            images.append(imagesList[index].fileName!)
           }
          }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! funcentercell
        
        
         cell.lblevent.text=items[indexPath.item]
        
               
        let imagedownload = DownloadImage()
        let temp = images[indexPath.row]
        imagedownload.setImage(imageurlString: temp, imageView: cell.imggallery)
       /* let profileimage = imagedownload.userImage(imageurlString: temp)
        
        if(profileimage != nil){
            cell.imggallery.image = profileimage
        }*/
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let img=images[indexPath.row]
        let srno = items[indexPath.row]
        let alerts = Alerts(category: srno, msgText: "", attachmentExists: true, attachimage: img, aldate: "", initial: "")
        
       performSegue(withIdentifier: "Sguebigimage", sender: alerts)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if  let destination = segue.destination as? AlertViewImageVC
     {
        if let alert = sender as? Alerts{
            
            destination.CWDtls = alert
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
