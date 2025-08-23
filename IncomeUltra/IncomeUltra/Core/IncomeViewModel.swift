//
//  IncomeViewModel.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import Foundation
import Observation
import Combine
import Factory

@MainActor
@Observable
final class IncomeViewModel {
    @ObservationIgnored private var cancellables: Set<AnyCancellable> = []
    @ObservationIgnored @Injected(\.incomeStore) private var incomeStore
    @ObservationIgnored @Injected(\.appInfoStore) private var appInfoStore
    
    var selectedIncomeType: IncomePickerView.IncomeType = .salary
    var salaryInput: SalaryInput = SalaryInput() {
        didSet {
            salaryInputPublisher.send(salaryInput)
        }
    }
    var hourlyInput: HourlyInput = HourlyInput() {
        didSet {
            hourlyInputPublisher.send(hourlyInput)
        }
    }
    var salaryOutput: SalaryOutput = SalaryOutput()
    var hourlyOutput: HourlyOutput = HourlyOutput()
    
    private var salaryInputPublisher: PassthroughSubject<SalaryInput, Never> = .init()
    private var hourlyInputPublisher: PassthroughSubject<HourlyInput, Never> = .init()
    
    var appName: String {
        appInfoStore.name
    }
    var shouldShowOvertimeCheck: Bool {
        (hourlyInput.hoursPerWeek ?? 0) > hourlyInput.hoursPerWeekLimitForOvertime
    }
    
    init() {
        setSubscribers()
    }
    
    private func setSubscribers() {
        setSalaryInputSubscriber()
        setHourlyInputSubscriber()
    }
    
    private func setSalaryInputSubscriber() {
        salaryInputPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] salaryInput in
                guard let self else { return }
                salaryOutput = incomeStore.getSalaryOutput(for: salaryInput)
            }
            .store(in: &cancellables)
    }
    
    private func setHourlyInputSubscriber() {
        hourlyInputPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] hourlyInput in
                guard let self else { return }
                hourlyOutput = incomeStore.getHourlyOutput(for: hourlyInput)
            }
            .store(in: &cancellables)
    }
}
