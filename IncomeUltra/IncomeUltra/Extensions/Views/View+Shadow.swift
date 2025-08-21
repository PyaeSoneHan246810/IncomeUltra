//
//  View+Shadow.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import SwiftUI

struct AppShadow {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
}

extension View {
    func shadow(_ appShadow: AppShadow) -> some View {
        self.shadow(
            color: appShadow.color,
            radius: appShadow.radius,
            x: appShadow.x,
            y: appShadow.y
        )
    }
}

extension AppShadow {
    static let none: Self = .init(color: .black.opacity(0.0), radius: 0.0, x: 0.0, y: 0.0)
    static let light: Self = .init(color: .black.opacity(0.03), radius: 2.0, x: 0.0, y: 2.0)
    static let regular: Self = .init(color: .black.opacity(0.1), radius: 2.0, x: 0.0, y: 2.0)
    static let heavy: Self = .init(color: .black.opacity(0.2), radius: 2.0, x: 0.0, y: 2.0)
    static let topLight: Self = .init(color: .black.opacity(0.03), radius: 2.0, x: 0.0, y: -2.0)
    static let topRegular: Self = .init(color: .black.opacity(0.1), radius: 2.0, x: 0.0, y: -2.0)
    static let topHeavy: Self = .init(color: .black.opacity(0.2), radius: 2.0, x: 0.0, y: -2.0)
}

fileprivate struct Preview: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8.0)
            .frame(width: 200.0, height: 200.0)
            .foregroundStyle(.white)
            .shadow(.regular)
    }
}

#Preview {
    Preview()
}
