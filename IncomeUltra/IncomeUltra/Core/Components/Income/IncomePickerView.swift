//
//  IncomePickerView.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import SwiftUI

struct IncomePickerView: View {
    @Binding var incomeType: IncomeType
    init(_ incomeType: Binding<IncomeType>) {
        self._incomeType = incomeType
    }
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                selectedItemBackgroundView(proxy)
                pickerView
            }
            .background {
                RoundedRectangle(cornerRadius: AppCornerRadius.button.value)
                    .foregroundStyle(Color.appColorTheme.cellBackground.opacity(0.4))
            }
            .shadow(.regular)
        }
        .frame(height: 40.0)
    }
}

private extension IncomePickerView {
    func selectIncomeType(_ incomeType: IncomeType) {
        withAnimation {
            self.incomeType = incomeType
        }
    }
}

private extension IncomePickerView {
    @ViewBuilder
    func selectedItemBackgroundView(_ proxy: GeometryProxy) -> some View {
        let width = proxy.size.width / CGFloat(IncomeType.allCases.count)
        let selectedIndex = IncomeType.allCases.firstIndex(of: incomeType) ?? 0
        let offset = CGFloat(selectedIndex) * width
        RoundedRectangle(cornerRadius: AppCornerRadius.button.value)
            .foregroundStyle(Color.appColorTheme.cellBackground)
            .frame(width: width)
            .offset(x: offset)
            .animation(.spring(response: 0.5, dampingFraction: 0.7), value: incomeType)
    }
    var pickerView: some View {
        HStack(spacing: 0.0) {
            ForEach(IncomeType.allCases) { incomeType in
                let isIncomeTypeSelected = incomeType == self.incomeType
                OptionButtonView(
                    incomeType: incomeType,
                    isSelected: isIncomeTypeSelected) {
                        selectIncomeType(incomeType)
                    }
            }
        }
    }
}

private extension IncomePickerView {
    struct OptionButtonView: View {
        let incomeType: IncomeType
        let isSelected: Bool
        let action: () -> Void
        var body: some View {
            Text(incomeType.description)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(isSelected ? Color.appColorTheme.text : Color.appColorTheme.text.opacity(0.7))
                .padding(8.0)
                .infinityWidth()
                .contentShape(.rect)
                .button(.plain, action: action)
        }
    }
}

extension IncomePickerView {
    enum IncomeType: Identifiable, CaseIterable, CustomStringConvertible {
        case salary
        case hourly
        var id: UUID {
            .init()
        }
        var description: String {
            switch self {
            case .salary:
                "Salary"
            case .hourly:
                "Hourly"
            }
        }
    }
}

#Preview {
    @Previewable @State var incomeType: IncomePickerView.IncomeType = .salary
    IncomePickerView($incomeType)
    .padding()
    .infinityFrame()
    .background(Color.appColorTheme.viewBackground)
}
