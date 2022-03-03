//
//  Date+Extension.swift
//  Fast-Post
//
//  Created by  kraken808 on 02.03.2022.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let strdt = dateFormatter.string(from: self as Date)
        if let dtDate = dateFormatter.date(from: strdt){
            return dateFormatter.string(from: dtDate)
        }
        return "--"
    }
}
