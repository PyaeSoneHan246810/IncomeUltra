//
//  WelcomeViewModel.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import Observation

@MainActor
@Observable
final class WelcomeViewModel {
    func getAppName() -> String {
        return "Income Ultra"
    }
}
