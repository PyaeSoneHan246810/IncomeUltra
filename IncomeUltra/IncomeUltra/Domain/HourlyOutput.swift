//
//  HourlyOutput.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import Foundation

struct HourlyOutput {
    let takehomePay: Pay
    let grossPay: Pay
    init(takehomePay: Pay = .init(incomeType: .takehome), grossPay: Pay = .init(incomeType: .gross)) {
        self.takehomePay = takehomePay
        self.grossPay = grossPay
    }
}
