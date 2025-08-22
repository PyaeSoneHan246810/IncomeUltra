//
//  IncomeViewModel.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import Observation
import Factory

@MainActor
@Observable
final class IncomeViewModel {
    @ObservationIgnored @Injected(\.incomeStore) private var incomeStore
    @ObservationIgnored @Injected(\.appInfoStore) private var appInfoStore
    
    var selectedIncomeType: IncomePickerView.IncomeType = .salary
    var salaryInput: SalaryInput = SalaryInput()
    var hourlyInput: HourlyInput = HourlyInput()
    var salaryOutput: SalaryOutput = SalaryOutput()
    var hourlyOutput: HourlyOutput = HourlyOutput()
    
    var appName: String {
        appInfoStore.name
    }
    var shouldShowOvertimeCheck: Bool {
        (hourlyInput.hoursPerWeek ?? 0) > hourlyInput.hoursPerWeekLimitForOvertime
    }
}
