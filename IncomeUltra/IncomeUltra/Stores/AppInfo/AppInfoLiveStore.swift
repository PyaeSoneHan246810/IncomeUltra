//
//  AppInfoLiveStore.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import Foundation

struct AppInfoLiveStore {
    var name: String {
        if let name = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String {
            return name
        } else {
            return "-"
        }
    }
    let description: String = "Income Ultra calculates your income from hourly rates or salary, including overtime, and provides detailed financial breakdowns."
    let developer: String = "Pyae Sone Han"
    let website: String = "https://example.com"
    let agreements: Agreements = .init()
    var version: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        } else {
            return "-"
        }
    }
    var compatibility: String {
        if let minOSVersion = Bundle.main.infoDictionary?["MinimumOSVersion"] as? String {
            return minOSVersion
        } else {
            return "-"
        }
    }
}

extension AppInfoLiveStore {
    struct Agreements {
        let privacyPolicyUrl: String = "https://example.com"
        let termsAndConditionsUrl: String = "https://example.com"
        let copyrightPolicyUrl: String = "https://example.com"
        let disclaimerUrl: String = "https://example.com"
    }
}
