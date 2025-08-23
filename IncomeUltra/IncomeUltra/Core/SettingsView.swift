//
//  SettingsView.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import SwiftUI

struct SettingsView: View {
    @State private var viewModel: SettingsViewModel = .init()
    @AppStorage(UserDefaultsKeys.isDarkMode) private var isDarkMode: Bool = true
    var body: some View {
        contentView
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
    }
}

private extension SettingsView {
    var contentView: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                introView
                customizationView
                appinfoView
                agreementInfoView
            }
        }
        .contentMargins(.vertical, 8.0)
        .contentMargins(.horizontal, 16.0)
        .scrollIndicators(.hidden)
        .scrollContentBackground(.hidden)
        .infinityFrame()
        .background(Color.appColorTheme.viewBackground)
    }
    var introView: some View {
        IntroBoxView(
            data: viewModel.appIntroData
        )
    }
    var customizationView: some View {
        BoxView(
            title: "Customization",
            sfSymbol: "paintbrush"
        ) {
            HStack {
                Text("Dark Mode")
                Spacer()
                Toggle(isOn: $isDarkMode, label: {})
                    .tint(Color.appColorTheme.accent)
                    .labelsHidden()
            }
        }
    }
    var appinfoView: some View {
        InfoBoxView(
            data: viewModel.appInfoData
        )
    }
    var agreementInfoView: some View {
        InfoBoxView(
            data: viewModel.agreementInfoData
        )
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
