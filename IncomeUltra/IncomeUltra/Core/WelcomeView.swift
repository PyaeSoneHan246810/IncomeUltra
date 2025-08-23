//
//  WelcomeView.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var shouldShowWelcomeView: Bool
    @State private var viewModel: WelcomeViewModel = WelcomeViewModel()
    var body: some View {
        VStack {
            titleView
            Spacer()
            VStack(spacing: 0.0) {
                welcomeImageView
                welcomeTextView
            }
            Spacer()
            getStartedButtonView
        }
        .padding()
        .infinityFrame()
        .background(Color.appColorTheme.viewBackground)
    }
}

private extension WelcomeView {
    var titleView: some View {
        Text(viewModel.appName)
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color.appColorTheme.text)
    }
    var welcomeImageView: some View {
        Image(.welcome)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }
    var welcomeTextView: some View {
        Text("Effortlessly calculate your income.\nLet's get started!")
            .multilineTextAlignment(.center)
            .font(.title3)
            .fontWeight(.medium)
            .foregroundStyle(Color.appColorTheme.secondaryText)
    }
    var getStartedButtonView: some View {
        Text("Get Started")
            .primaryButton {
                shouldShowWelcomeView = false
            }
    }
}

#Preview {
    WelcomeView(
        shouldShowWelcomeView: .constant(true)
    )
}
