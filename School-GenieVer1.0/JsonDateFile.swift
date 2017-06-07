//
//  JsonDateFile.swift
//  School-GenieVer1.0
//
//  Created by sachin shinde on 14/12/16.
//  Copyright © 2016 Realizer. All rights reserved.
//

import Foundation



extension Date {
    init?(jsonDate: String) {
        
        let pattern = "\\\\?/Date\\((\\d+)(([+-]\\d{2})(\\d{2}))?\\)\\\\?/"
        let regex = try! NSRegularExpression(pattern: pattern)
        guard let match = regex.firstMatch(in: jsonDate, range: NSRange(location: 0, length: jsonDate.utf16.count)) else {
            return nil
        }
        
        // Extract milliseconds:
        let dateString = (jsonDate as NSString).substring(with: match.rangeAt(1))
        // Convert to UNIX timestamp in seconds:
        let timeStamp = Double(dateString)! / 1000.0
        // Create Date from timestamp:
        self.init(timeIntervalSince1970: timeStamp)
    }
}
