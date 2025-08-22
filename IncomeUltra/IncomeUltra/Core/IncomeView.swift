//
//  IncomeView.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import SwiftUI

struct IncomeView: View {
    @State private var viewModel: IncomeViewModel = IncomeViewModel()
    var body: some View {
        content
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                toolbarContent
            }
    }
}

private extension IncomeView {
    var content: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                
            }
        }
    }
    @ToolbarContentBuilder
    var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            HStack(spacing: 4.0) {
                Image(systemName: "dollarsign.circle")
                    .foregroundStyle(Color.appColorTheme.accent)
                Text(viewModel.appName)
            }
            .fontWeight(.semibold)
        }
    }
}

#Preview {
    NavigationStack {
        IncomeView()
    }
}
