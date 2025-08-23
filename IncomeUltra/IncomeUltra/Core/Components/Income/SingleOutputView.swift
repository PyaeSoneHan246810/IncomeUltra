//
//  SingleOutputView.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import SwiftUI

struct SingleOutputView: View {
    let name: String
    let value: Double
    var body: some View {
        HStack {
            nameView
            Spacer()
            valueView
        }
        .padding()
        .infinityWidth()
        .background(Color.appColorTheme.cellBackground)
        .cornerRadius(.cell)
    }
}

private extension SingleOutputView {
    var nameView: some View {
        Text(name)
            .font(.callout)
            .foregroundStyle(Color.appColorTheme.secondaryText)
    }
    var valueView: some View {
        Text("$ \(value.formattedWithTwoDecimals)")
            .fontWeight(.semibold)
            .foregroundStyle(Color.appColorTheme.accent)
    }
}

#Preview {
    SingleOutputView(
        name: "Hourly Wage",
        value: 25.50
    )
    .padding()
    .infinityFrame()
    .background(Color.appColorTheme.viewBackground)
}
