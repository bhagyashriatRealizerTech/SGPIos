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
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = [String]()
    var images = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        menu.target=self.revealViewController()
        //menu.action=SWRevealViewController.revealToggle(self)
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        funview.addGestureRecognizer(revealViewController().panGestureRecognizer())
        var imageView = UIImageView()
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
        let eventmthod = FunCenterEventMethods()
        var eventlist = [FunCenterEventModel]()
        eventlist = eventmthod.getFunCenterEvent()
        
        for index in 0...(eventlist.count - 1){
            images.append(eventlist[index].ThumbNailPath!)
            items.append(eventlist[index].Event!)
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
        
        cell.imggallery.loadGif(name: "ring-alt")
        cell.imggallery.startAnimating()
        
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
    
    // tell the collection view how many cells to make
   /* func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectioncell
        
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        // cell.lblnumber.text = self.items[indexPath.item]
        cell.imggallery.image=#imageLiteral(resourceName: "flower")
        //cell.image=#imageLiteral(resourceName: "flower")
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    /*func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
     
     let picDimension=collectionview.frame.size.width/3.0
     let numberOfItemsPerRow: CGFloat = 3.0
     // let heightAdjustment: CGFloat = 30.0
     
     let bounds = UIScreen.main.bounds
     let width = (bounds.size.width) / numberOfItemsPerRow
     let layout = collectionview.collectionViewLayout as! UICollectionViewFlowLayout
     layout.itemSize = CGSize(width: width, height: width)
     //let picDimension = self.view.frame.size.width / 3.0
     return CGSize(width: width, height: width)
     }*/
    
    /* func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
     let leftRightInset = self.view.frame.size.width / 14.0
     return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
     }*/
    
    
    // MARK: - UICollectionViewDelegate protocol
    */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
         performSegue(withIdentifier: "Sguefuncenter  ", sender: nil)
            }
    
    
    func imageTapped(img: AnyObject)
    {
        performSegue(withIdentifier: "Sguefuncenter  ", sender: nil)

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
