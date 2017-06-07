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
        
        var datestring:String = timeTable.timeTableDate
        let datefile = DateFile()
        datestring = datefile.getDate(date: timeTable.timeTableDate.components(separatedBy: " ")[0], FLAG: "D")
        if(datestring.isEmpty){
            timeTableDate.text = timeTable.timeTableDate
        }
        else{
        timeTableDate.text = datestring
        }
        if(!timeTable.timeTableAttachment){
           attachmentImage.image = #imageLiteral(resourceName: "whiteN")
        }
        
        
        
    }
    
}
