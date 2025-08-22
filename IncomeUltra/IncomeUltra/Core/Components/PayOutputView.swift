//
//  PayOutputView.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import SwiftUI

struct PayOutputView: View {
    let pay: Pay
    var body: some View {
        VStack(spacing: 12.0) {
            titleView
            payBreakdownView
        }
        .padding()
        .background(Color.appColorTheme.cellBackground)
        .cornerRadius(.cell)
    }
}

private extension PayOutputView {
    var titleView: some View {
        Text("\(pay.incomeTypeDescription) Pay")
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(Color.appColorTheme.alternateAccent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    var payBreakdownView: some View {
        ForEach(pay.breakdown, id: \.name) { (name, value) in
            let isLastItem = pay.breakdown.last?.name == name
            PayOutputRowView(name: name, value: value)
            if !isLastItem {
                dividerView
            }
        }
    }
    var dividerView: some View {
        Divider()
            .foregroundStyle(Color.appColorTheme.divider)
    }
}

#Preview {
    PayOutputView(
        pay: Pay()
    )
    .padding()
    .infinityFrame()
    .background(Color.appColorTheme.viewBackground)
}
