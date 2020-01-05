//
//  Date+Extension.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

extension Date {
    var formmatedDateForPortuguese: String {
        let formater = DateFormatter()
        formater.locale = Locale(identifier: "pt_BR")
        formater.dateFormat = "MMMM"  // "MMM" for short names and  MMMM for long names

        let monthString = formater.string(from: self).capitalized
        let calendar = Calendar.current
        
        return "\(calendar.component(.day, from: self)) de \(monthString) de \(calendar.component(.year, from: self))"
    }
    
    static func stringDateToDate(stringDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let date = dateFormatter.date(from: stringDate)
        return date
    }
}
