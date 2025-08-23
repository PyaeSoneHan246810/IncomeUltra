//
//  BoxView.swift
//  IncomeUltra
//
//  Created by Dylan on 23/8/25.
//

import SwiftUI

struct BoxView<Content: View>: View {
    let title: String
    let sfSymbol: String?
    @ViewBuilder let content: Content
    var body: some View {
        VStack(spacing: 8.0) {
            headerView
            dividerView
            content
        }
        .padding()
        .background(Color.appColorTheme.cellBackground)
        .cornerRadius(.cell)
    }
}

private extension BoxView {
    var headerView: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            Spacer()
            if let imageName = sfSymbol {
                Image(systemName: imageName)
            }
        }
        .foregroundStyle(Color.appColorTheme.text)
    }
    var dividerView: some View {
        Divider()
            .foregroundStyle(Color.appColorTheme.divider)
    }
}

#Preview {
    BoxView(
        title: "Income Ultra",
        sfSymbol: "info.circle"
    ) {
        Text("Content goes here")
    }
    .padding()
    .infinityFrame()
    .background(Color.appColorTheme.viewBackground)
}
