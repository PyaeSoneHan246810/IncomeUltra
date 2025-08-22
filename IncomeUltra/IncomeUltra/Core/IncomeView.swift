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
        contentView
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                toolbarContent
            }
    }
}

private extension IncomeView {
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
    var contentView: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                IncomePickerView($viewModel.selectedIncomeType)
                switch viewModel.selectedIncomeType {
                case .salary:
                    salaryView
                case .hourly:
                    horulyView
                }
            }
        }
        .contentMargins(.vertical, 8.0)
        .contentMargins(.horizontal, 16.0)
        .scrollIndicators(.hidden)
    }
    @ViewBuilder
    var salaryView: some View {
        salaryInputView
        salaryOutputView
    }
    @ViewBuilder
    var horulyView: some View {
        hourlyInputView
        hourlyOutputView
    }
    var salaryInputView: some View {
        Text("Salary Input View")
    }
    var salaryOutputView: some View {
        Text("Salary Output View")
    }
    var hourlyInputView: some View {
        Text("Hourly Input View")
    }
    var hourlyOutputView: some View {
        Text("Hourly Output View")
    }
}

#Preview {
    NavigationStack {
        IncomeView()
    }
}
