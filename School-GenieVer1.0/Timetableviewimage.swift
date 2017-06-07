//
//  Timetableviewimage.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 26/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class Timetableviewimage: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var lblimgname: UILabel!
    @IBOutlet weak var imgview: UIImageView!
    private var   _cwDtls:Alerts!
    
   var CWDtls : Alerts
        {
        get{
            return _cwDtls
        }
        set
        {
            _cwDtls = newValue
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let imagedownload = DownloadImage()
        let temp = CWDtls.attachimage
        imagedownload.setImage(imageurlString: temp, imageView: imgview)
               lblimgname.text = CWDtls.category
        
        
        // Do any additional setup after loading the view.
        scrollview.minimumZoomScale = 1.0
        scrollview.maximumZoomScale = 6.0
        
        scrollview.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return imgview
    }
    
    @IBOutlet weak var scrollview: UIScrollView!
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
    @IBAction func scaleImage(sender: UIPinchGestureRecognizer) {
        self.view.transform = self.view.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
}
