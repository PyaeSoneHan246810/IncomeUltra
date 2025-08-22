//
//  InputTextFieldView.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import SwiftUI

struct InputTextFieldView<Format: ParseableFormatStyle>: View where Format.FormatInput == Double, Format.FormatOutput == String {
    let placeholder: String
    @Binding var value: Double?
    let format: Format
    var body: some View {
        TextField(placeholder, value: $value, format: format)
            .inputTextField()
    }
}

#Preview {
    @Previewable @State var value: Double? = nil
    InputTextFieldView(
        placeholder: "$ 65,000",
        value: $value,
        format: .number
    )
    .padding()
    .infinityFrame()
    .background(Color.appColorTheme.viewBackground)
}
