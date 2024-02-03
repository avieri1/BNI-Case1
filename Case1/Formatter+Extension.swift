//
//  Formatter+Extension.swift
//  Case1
//
//  Created by aldo on 31/01/24.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: "en_US")
        formatter.groupingSeparator = "."
        
        return formatter
    }()
    
}
