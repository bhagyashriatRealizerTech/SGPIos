//
//  TimeTableCell.swift
//  ParentViewStar
//
//  Created by Mac on 23/11/16.
//  Copyright © 2016 Realizer Tech. All rights reserved.
//

import UIKit

class TimeTableCell: UITableViewCell {
    
    
    @IBOutlet weak var givenBy: UILabel!
    
    @IBOutlet weak var timeTabletitle: UILabel!
    
    
    @IBOutlet weak var attachmentImage: UIImageView!
    
    
    @IBOutlet weak var timeTableDate: UILabel!
    
    override func awakeFromNib() {
        return super.awakeFromNib()
    }
    
    func updateUI(_ timeTable: TimeTable)
    {
        givenBy.text = timeTable.timeTableGivenby
        timeTabletitle.text = timeTable.timeTableTitle
        timeTableDate.text = timeTable.timeTableDate
        if(!timeTable.timeTableAttachment){
           attachmentImage.image = #imageLiteral(resourceName: "whiteN")
        }
    }
    
}
