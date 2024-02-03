//
//  Numeric+Extension.swift
//  Case1
//
//  Created by aldo on 31/01/24.
//

import Foundation

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
