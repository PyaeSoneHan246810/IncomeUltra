//
//  SalaryInput.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import Foundation

struct SalaryInput {
    var yearlyGross: Double?
    var takehomePercentage: Double?
    init(yearlyGross: Double? = nil, takehomePercentage: Double? = nil) {
        self.yearlyGross = yearlyGross
        self.takehomePercentage = takehomePercentage
    }
}
