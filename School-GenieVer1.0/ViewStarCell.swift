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
        starDate.text = viewstar.StarDate
        starComment.text = viewstar.Comment
        
    }
    


}
