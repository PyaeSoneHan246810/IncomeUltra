//
//  WelcomeViewModel.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import Observation
import Factory

@MainActor
@Observable
final class WelcomeViewModel {
    @ObservationIgnored @Injected(\.appInfoStore) private var appInfoStore
    func getAppName() -> String {
        return appInfoStore.name
    }
}
