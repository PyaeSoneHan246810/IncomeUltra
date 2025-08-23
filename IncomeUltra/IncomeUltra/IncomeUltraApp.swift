//
//  IncomeUltraApp.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import SwiftUI

@main
struct IncomeUltraApp: App {
    @AppStorage(UserDefaultsKeys.isDarkMode) private var isDarkMode: Bool = true
    var colorScheme: ColorScheme {
        isDarkMode ? .dark : .light
    }
    var body: some Scene {
        WindowGroup {
            AppStartingView()
                .preferredColorScheme(colorScheme)
        }
    }
}
