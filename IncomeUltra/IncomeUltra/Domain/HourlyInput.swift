//
//  HourlyInput.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

struct HourlyInput {
    var hourlyWage: Double?
    var hoursPerWeek: Double?
    var takehomePercentage: Double?
    var overtime: Bool
    init(hourlyWage: Double? = nil, hoursPerWeek: Double? = nil, takehomePercentage: Double? = nil, overtime: Bool = true) {
        self.hourlyWage = hourlyWage
        self.hoursPerWeek = hoursPerWeek
        self.takehomePercentage = takehomePercentage
        self.overtime = overtime
    }
    let hoursPerWeekLimitForOvertime: Double = 40
}
