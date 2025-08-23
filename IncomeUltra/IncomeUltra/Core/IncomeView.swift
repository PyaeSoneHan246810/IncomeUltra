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
            .hideKeyboardOnTap()
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
        .scrollContentBackground(.hidden)
        .infinityFrame()
        .background(Color.appColorTheme.viewBackground)
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
    @ViewBuilder
    var salaryInputView: some View {
        InputView(
            info: InputView.InputViewInfo(
                name: "Yearly Gross ($)",
                placeholder: "$ 65,000",
                format: .number
            ),
            value: $viewModel.salaryInput.yearlyGross
        )
        InputView(
            info: InputView.InputViewInfo(
                name: "Take Home (%)",
                placeholder: "83.00 %",
                isRequired: false,
                format: .percent
            ),
            value: $viewModel.salaryInput.takehomePercentage
        )
    }
    @ViewBuilder
    var salaryOutputView: some View {
        SingleOutputView(
            name: "Hourly Wage",
            value: viewModel.salaryOutput.hourlyWage
        )
        PayOutputView(
            pay: viewModel.salaryOutput.takehomePay
        )
        PayOutputView(
            pay: viewModel.salaryOutput.grossPay
        )
    }
    @ViewBuilder
    var hourlyInputView: some View {
        InputView(
            info: InputView.InputViewInfo(
                name: "Hourly Wage ($)",
                placeholder: "$ 36.50",
                format: .number
            ),
            value: $viewModel.hourlyInput.hourlyWage
        )
        InputView(
            info: InputView.InputViewInfo(
                name: "Hours per Week",
                placeholder: "40",
                format: .number
            ),
            value: $viewModel.hourlyInput.hoursPerWeek
        )
        InputView(
            info: InputView.InputViewInfo(
                name: "Take Home (%)",
                placeholder: "83.00 %",
                isRequired: false,
                format: .percent
            ),
            value: $viewModel.hourlyInput.takehomePercentage
        )
        if viewModel.shouldShowOvertimeCheck {
            overtimeRateToggleView
        }
    }
    var overtimeRateToggleView: some View {
        HStack {
            Text("Overtime Rate")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(.accent)
            Spacer()
            Toggle(isOn: $viewModel.hourlyInput.overtime, label: {})
                .tint(Color.appColorTheme.accent)
                .labelsHidden()
        }
    }
    @ViewBuilder
    var hourlyOutputView: some View {
        PayOutputView(
            pay: viewModel.hourlyOutput.takehomePay
        )
        PayOutputView(
            pay: viewModel.hourlyOutput.grossPay
        )
    }
}

#Preview {
    NavigationStack {
        IncomeView()
    }
}
