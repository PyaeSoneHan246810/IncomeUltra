//
//  View+Color.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import SwiftUI

extension Color {
    static let appColorTheme: AppColorTheme = main
}

extension Color {
    static var main: AppColorTheme {
        AppColorTheme(
            accent: Color.accent,
            alternateAccent: Color.alternateAccent,
            viewBackground: Color.viewBackground,
            cellBackground: Color.cellBackground,
            text: Color.text,
            secondaryText: Color.secondaryText,
            accentContrastText: Color.accentContrastText,
            primaryAction: Color.primaryAction,
            neutralAction: Color.neutralAction,
            destructive: Color.destructive,
            success: Color.success,
            warning: Color.warning,
            info: Color.info,
            error: Color.error,
            inProgress: Color.inProgress,
            divider: Color.divider,
            miscellaneous: Color.miscellaneous
        )
    }
}

struct AppColorTheme {
    let accent: Color
    let alternateAccent: Color
    let viewBackground: Color
    let cellBackground: Color
    let text: Color
    let secondaryText: Color
    let accentContrastText: Color
    let primaryAction: Color
    let neutralAction: Color
    let destructive: Color
    let success: Color
    let warning: Color
    let info: Color
    let error: Color
    let inProgress: Color
    let divider: Color
    let miscellaneous: Color
}
