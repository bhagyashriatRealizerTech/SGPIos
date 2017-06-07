//
//  FuncenterVC.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 23/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class FuncenterVC: UIViewController {
    @IBOutlet weak var imageListView: UIView!
    let myImages=[String]()

    @IBOutlet var imagelistview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let panelX = imageListView.frame.origin.x
        let panelY = 50
        
        

        
        let widthvalue=100
        let heightvalue=100
        
        var cwImgView = [UIImageView]()
        var stackView = UIStackView(arrangedSubviews: cwImgView)
    
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //myImages =
        
        for i in 0 ..< myImages.count
        {
            let div=i/3
            let remender=i%3
            
           // let myImage:UIImage=UIImage(named: myImages[i])!
            
            let myImageView:UIImageView = UIImageView(frame:CGRect(x: Int(panelX)+(remender*110)+10, y: Int(panelY)+(div*110)+10, width: widthvalue, height: heightvalue))
            
            let imagedownload = DownloadImage()
            let myImage = imagedownload.userImage(imageurlString: myImages[i])
           
            myImageView.image = myImage
            
            
            
            myImageView.backgroundColor=UIColor.blue
            
            
            stackView.addSubview(myImageView)
        
                   }
        
       
        
        
        imageListView.addSubview(stackView)
        var imageView = imageListView
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        imageView?.isUserInteractionEnabled = true
        imageView?.addGestureRecognizer(tapGestureRecognizer)
        

        // Do any additional setup after loading the view.
    }
    func imageTapped(img: AnyObject)
    {
        performSegue(withIdentifier: "Sgueimagecllick", sender: nil)
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
