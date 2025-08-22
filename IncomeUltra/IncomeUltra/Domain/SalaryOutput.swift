//
//  SalaryOutput.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import Foundation

struct SalaryOutput {
    let hourlyWage: Double
    let takehomePay: Pay
    let grossPay: Pay
    init(hourlyWage: Double = 0.0, takehomePay: Pay = .init(incomeType: .takehome), grossPay: Pay = .init(incomeType: .gross)) {
        self.hourlyWage = hourlyWage
        self.takehomePay = takehomePay
        self.grossPay = grossPay
    }
}
