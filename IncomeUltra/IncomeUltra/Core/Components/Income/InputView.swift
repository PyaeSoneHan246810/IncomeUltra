//
//  InputView.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import SwiftUI

struct InputView<Format: ParseableFormatStyle>: View where Format.FormatInput == Double, Format.FormatOutput == String {
    let info: InputViewInfo
    @Binding var value: Double?
    var body: some View {
        HStack {
            nameView
            textFieldView
        }
        .infinityWidth()
    }
}

private extension InputView {
    var nameView: some View {
        HStack(spacing: 4.0) {
            Text(info.name)
            Text(info.isRequired ? "*" : "")
                .foregroundStyle(Color.appColorTheme.destructive)
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(Color.appColorTheme.secondaryText)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    var textFieldView: some View {
        InputTextFieldView(
            placeholder: info.placeholder,
            value: $value,
            format: info.format
        )
    }
}

extension InputView {
    struct InputViewInfo {
        let name: String
        let placeholder: String
        var isRequired: Bool = true
        var format: Format
    }
}

#Preview {
    @Previewable @State var value: Double? = nil
    InputView(
        info: InputView.InputViewInfo(
            name: "Yearly Gross ($)",
            placeholder: "$ 65,000",
            format: .number
        ),
        value: $value
    )
    .padding()
    .infinityFrame()
    .background(Color.appColorTheme.viewBackground)
}
