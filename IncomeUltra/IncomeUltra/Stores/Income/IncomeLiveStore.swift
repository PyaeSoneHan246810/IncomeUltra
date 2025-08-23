//
//  IncomeLiveStore.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import Foundation

final class IncomeLiveStore: IncomeStore {
    func getSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput {
        calculateSalaryOutput(for: salaryInput)
    }
    func getHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput {
        calculateHourlyOutput(for: hourlyInput)
    }
}

private extension IncomeLiveStore {
    func calculateSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput {
        let weeksInYear: Double = 52
        let monthsInYear: Double = 12
        let hoursPerWeek: Double = 40
        
        guard let yearlyGross: Double = salaryInput.yearlyGross else {
            return .init()
        }
        let weeklyGross: Double = yearlyGross / weeksInYear
        let biWeeklyGross: Double = weeklyGross * 2
        let fourWeeklyGross: Double = weeklyGross * 4
        let monthlyGross: Double = yearlyGross / monthsInYear
        
        let takehomePercentageDefault: Double = 83.00 / 100
        let takehomePercentage: Double = salaryInput.takehomePercentage ?? takehomePercentageDefault
        let takehomeWeekly: Double = weeklyGross * takehomePercentage
        let takehomeBiWeekly: Double = biWeeklyGross * takehomePercentage
        let takehomeFourWeekly: Double = fourWeeklyGross * takehomePercentage
        let takehomeMonthly: Double = monthlyGross * takehomePercentage
        let takehomeYearly: Double = yearlyGross * takehomePercentage
        
        let hourlyWage: Double = weeklyGross / hoursPerWeek
        let takehomePay: Pay = Pay(incomeType: .takehome, weekly: takehomeWeekly, biWeekly: takehomeBiWeekly, fourWeekly: takehomeFourWeekly, monthly: takehomeMonthly, yearly: takehomeYearly)
        let grossPay: Pay = Pay(incomeType: .gross, weekly: weeklyGross, biWeekly: biWeeklyGross, fourWeekly: fourWeeklyGross, monthly: monthlyGross, yearly: yearlyGross)
        
        let salaryOutput: SalaryOutput = SalaryOutput(
            hourlyWage: hourlyWage,
            takehomePay: takehomePay,
            grossPay: grossPay
        )
        return salaryOutput
    }
    func calculateHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput {
        guard let hourlyWage = hourlyInput.hourlyWage, let hoursPerWeek = hourlyInput.hoursPerWeek else {
            return .init()
        }
        let weeksInYear: Double = 52
        let monthsInYear: Double = 12
        let hoursPerWeekLimitForOvertime: Double = 40
        let overtimeRate: Double = 1.5
        let regularHours = min(hoursPerWeek, hoursPerWeekLimitForOvertime)
        let overtimeHours = max(0, hoursPerWeek - hoursPerWeekLimitForOvertime)
        let overtimeHourlyWage = hourlyWage * overtimeRate
        let shouldCalculateOvertime: Bool = (overtimeHours > 0 && hourlyInput.overtime)
        
        let weeklyGross: Double = shouldCalculateOvertime ? (regularHours * hourlyWage) + (overtimeHours * overtimeHourlyWage) : (hoursPerWeek * hourlyWage)
        let biWeeklyGross: Double = weeklyGross * 2
        let fourWeeklyGross: Double = weeklyGross * 4
        let yearlyGross: Double = weeklyGross * weeksInYear
        let monthlyGross: Double = yearlyGross / monthsInYear
        
        let takehomePercentageDefault: Double = 83.00 / 100
        let takehomePercentage: Double = hourlyInput.takehomePercentage ?? takehomePercentageDefault
        let takehomeWeekly: Double = weeklyGross * takehomePercentage
        let takehomeBiWeekly: Double = biWeeklyGross * takehomePercentage
        let takehomeFourWeekly: Double = fourWeeklyGross * takehomePercentage
        let takehomeMonthly: Double = monthlyGross * takehomePercentage
        let takehomeYearly: Double = yearlyGross * takehomePercentage
        
        let takehomePay: Pay = Pay(incomeType: .takehome, weekly: takehomeWeekly, biWeekly: takehomeBiWeekly, fourWeekly: takehomeFourWeekly, monthly: takehomeMonthly, yearly: takehomeYearly)
        let grossPay: Pay = Pay(incomeType: .gross, weekly: weeklyGross, biWeekly: biWeeklyGross, fourWeekly: fourWeeklyGross, monthly: monthlyGross, yearly: yearlyGross)
        let hourlyOutput: HourlyOutput = HourlyOutput(
            takehomePay: takehomePay,
            grossPay: grossPay
        )
        return hourlyOutput
    }
}
