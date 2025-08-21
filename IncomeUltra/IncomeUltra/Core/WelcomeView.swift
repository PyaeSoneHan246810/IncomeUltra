//
//  WelcomeView.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var shouldShowWelcomeView: Bool
    var body: some View {
        VStack {
            Text("Welcome View")
            Button {
                shouldShowWelcomeView = false
            } label: {
                Text("Get Started")
            }
        }
    }
}

#Preview {
    WelcomeView(
        shouldShowWelcomeView: .constant(true)
    )
}
