//
//  Double+Extensions.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import Foundation

extension Double {
    var formattedWithTwoDecimals: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        let formattedString = numberFormatter.string(from: NSNumber(value: self)) ?? "0.00"
        return formattedString
    }
    var formattedAsWholeCurrencyOrInvalid: String {
        guard self >= Double(Int.min), self <= Double(Int.max) else { return "Invalid" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0
        let formattedString = numberFormatter.string(from: NSNumber(value: self)) ?? "0"
        return formattedString
    }
}
