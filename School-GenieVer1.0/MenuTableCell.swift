//
//  MenuTableCell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 30/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class MenuTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var menuimage: UIImageView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var menu: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(menulabel:String,menuimage:UIImage)
    {
        menu.text = menulabel;
        img.image = menuimage ;
        //img = UIImageView(image: menuimage);
        
    }


}
