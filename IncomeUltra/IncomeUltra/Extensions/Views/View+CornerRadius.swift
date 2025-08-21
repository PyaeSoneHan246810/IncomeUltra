//
//  View+CornerRadius.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import SwiftUI

struct AppCornerRadius {
    let value: CGFloat
}

extension View {
    func cornerRadius(_ appCornerRadius: AppCornerRadius) -> some View {
        self
            .clipShape(RoundedRectangle(cornerRadius: appCornerRadius.value))
    }
}

extension AppCornerRadius {
    static let button: Self = .init(value: 8.0)
    static let textField: Self = .init(value: 8.0)
    static let cell: Self = .init(value: 8.0)
}

fileprivate struct Preview: View {
    var body: some View {
        Text("Corner Radius")
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.black)
            .cornerRadius(.button)
    }
}

#Preview {
    Preview()
}
