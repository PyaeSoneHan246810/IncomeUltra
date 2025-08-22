//
//  View+InputTextField.swift
//  IncomeUltra
//
//  Created by Dylan on 22/8/25.
//

import SwiftUI

extension View {
    func inputTextField() -> some View {
        self
            .keyboardType(.decimalPad)
            .padding(12.0)
            .infinityWidth()
            .background(Color.appColorTheme.cellBackground)
            .cornerRadius(.textField)
            .shadow(.regular)
    }
}

fileprivate struct Preview: View {
    var body: some View {
        TextField("Enter amount", text: .constant(""))
            .inputTextField()
    }
}

#Preview {
    Preview()
        .padding()
        .infinityFrame()
        .background(Color.appColorTheme.viewBackground)
}
