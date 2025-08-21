//
//  AppStartingView.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import SwiftUI

struct AppStartingView: View {
    @State private var viewModel: AppStartingViewModel = AppStartingViewModel()
    var body: some View {
        ZStack {
            if viewModel.shouldShowWelcomeView {
                WelcomeView(
                    shouldShowWelcomeView: $viewModel.shouldShowWelcomeView
                )
            } else {
                HomeTabView()
            }
        }
        .animation(.easeIn, value: viewModel.shouldShowWelcomeView)
    }
}

#Preview {
    AppStartingView()
}
