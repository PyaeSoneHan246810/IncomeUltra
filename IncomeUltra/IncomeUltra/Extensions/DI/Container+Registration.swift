//
//  Container+Registration.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import Foundation
import Factory

extension Container {
    var appInfoStore: Factory<AppInfoLiveStore> {
        self {
            MainActor.assumeIsolated {
                AppInfoLiveStore()
            }
        }.singleton
    }
    var incomeStore: Factory<IncomeStore> {
        self {
            MainActor.assumeIsolated {
                IncomeLiveStore()
            }
        }.singleton
    }
}
