//
//  IncomeStore.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import Foundation

protocol IncomeStore {
    func getSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput
    func getHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput
}
