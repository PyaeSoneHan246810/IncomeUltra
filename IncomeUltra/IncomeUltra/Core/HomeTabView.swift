//
//  HomeTabView.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            Tab("Income", systemImage: "dollarsign.square") {
                incomeTabView
            }
            Tab("Settings", systemImage: "gearshape") {
                settingsTabView
            }
        }
    }
}

private extension HomeTabView {
    var incomeTabView: some View {
        NavigationStack {
            IncomeView()
        }
    }
    var settingsTabView: some View {
        NavigationStack {
            SettingsView()
        }
    }
}

#Preview {
    HomeTabView()
}
