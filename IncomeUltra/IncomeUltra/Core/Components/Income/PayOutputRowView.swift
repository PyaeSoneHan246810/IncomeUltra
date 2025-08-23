//
//  PayOutputRowView.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import SwiftUI

struct PayOutputRowView: View {
    let name: String
    let value: Double
    var body: some View {
        HStack {
            nameView
            Spacer()
            valueView
        }
    }
}

private extension PayOutputRowView {
    var nameView: some View {
        Text(name)
            .font(.callout)
            .foregroundStyle(Color.appColorTheme.secondaryText)
    }
    var valueView: some View {
        Text("$ \(value.formattedAsWholeCurrencyOrInvalid)")
            .fontWeight(.semibold)
            .foregroundStyle(Color.appColorTheme.accent)
    }
}

#Preview {
    PayOutputRowView(
        name: "Weely", value: 1_117
    )
    .padding()
    .infinityFrame()
    .background(Color.appColorTheme.viewBackground)
}
