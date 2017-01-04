//
//  ViewStarCell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 29/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit


class ViewStarCell: UITableViewCell {

    @IBOutlet weak var starDate: UILabel!
    
    @IBOutlet weak var starComment: UILabel!
    
    @IBOutlet weak var starImage: UIImageView!
    
    
    override func awakeFromNib() {
        return super.awakeFromNib()
    }
    
    
    func updateUI(_ viewstar: StarModels)
    {
        let datemethod = DateFile()
        let date:String = datemethod.getMediumDate(date: viewstar.StarDate!)
        if(date.isEmpty){
             starDate.text = viewstar.StarDate
        }
        else{
           starDate.text = date
        }
       
        starComment.text = viewstar.Comment
        
        setStarImage(imageview: starImage, star: viewstar.Star!)
    }
    


}
