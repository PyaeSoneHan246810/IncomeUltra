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
    var appName: String {
        appInfoStore.name
    }
}
