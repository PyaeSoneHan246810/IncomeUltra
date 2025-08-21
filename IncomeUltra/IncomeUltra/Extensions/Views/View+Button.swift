//
//  View+Button.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import SwiftUI

enum ButtonStyleOption {
    case press
    case plain
}

extension View {
    func primaryButton(action: @escaping () -> Void) -> some View {
        self
            .font(.headline)
            .foregroundStyle(Color.appColorTheme.accentContrastText)
            .infinityWidth()
            .padding()
            .background(Color.appColorTheme.accent)
            .cornerRadius(.button)
            .shadow(.regular)
            .button(.press, action: action)
    }
    
    func destructiveButton(action: @escaping () -> Void) -> some View {
        self
            .font(.headline)
            .foregroundStyle(Color.appColorTheme.accentContrastText)
            .infinityWidth()
            .padding()
            .background(Color.appColorTheme.destructive)
            .cornerRadius(.button)
            .shadow(.regular)
            .button(.press, action: action)
    }
    
    func plainButton(action: @escaping () -> Void) -> some View {
        self
            .font(.headline)
            .foregroundStyle(Color.appColorTheme.text)
            .padding()
            .button(.plain, action: action)
    }
    @ViewBuilder
    func button(_ buttonStyleOption: ButtonStyleOption = .plain, action: @escaping () -> Void) -> some View {
        switch buttonStyleOption {
        case .press:
            self.applyPressButtonStyle(action)
        case .plain:
            self.applyPlainButtonStyle(action)
        }
    }
    private func applyPressButtonStyle(_ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            self
        }
        .buttonStyle(PressButtonStyle())
    }
    private func applyPlainButtonStyle(_ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            self
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct PressButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95: 1.0)
            .opacity(configuration.isPressed ? 0.95 : 1.0)
            .animation(.smooth, value: configuration.isPressed)
    }
}

struct PlainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

fileprivate struct Preview: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Primary Button")
                .primaryButton {
                    print("Primary Button clicked")
                }
            Text("Destructive Button")
                .destructiveButton {
                    print("Desctructive Button clicked")
                }
            Text("Plain Button")
                .plainButton {
                    print("Plain Button clicked")
                }
        }
    }
}

#Preview {
    Preview()
}
