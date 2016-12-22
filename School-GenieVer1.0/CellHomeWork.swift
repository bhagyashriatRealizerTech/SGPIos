//
//  CellHomeWork.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 16/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class CellHomeWork: UITableViewCell {
    
   
    @IBOutlet weak var imgattachment: UIImageView!
    @IBOutlet weak var lblsubject: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(SubjectText:String, Subject : String, isAttachment : Bool)
    {
        lbltitle.text = SubjectText;
        lblsubject.text = Subject;
        if(!isAttachment)
        {
                        imgattachment.image=#imageLiteral(resourceName: "whiteN")
        }
    }
    


}
