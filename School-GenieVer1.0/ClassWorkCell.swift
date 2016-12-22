//
//  ClassWorkCell.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 10/11/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import UIKit

class ClassWorkCell: UITableViewCell {

    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var imgattachment: UIImageView!
    @IBOutlet weak var lblsubject: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var i: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
           }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

           }
    func updateUI(classwork:ClassWork)
    {
        lbltitle.text=classwork.subject
        lblsubject.text=classwork.subjectText
        
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
