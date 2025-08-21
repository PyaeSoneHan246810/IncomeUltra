//
//  View+Extensions.swift
//  IncomeUltra
//
//  Created by Dylan on 21/8/25.
//

import SwiftUI

extension View {
    func infinityFrame() -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func infinityWidth() -> some View {
        self.frame(maxWidth: .infinity)
    }
    func infinityHeight() -> some View {
        self.frame(maxHeight: .infinity)
    }
}

fileprivate struct Preview: View {
    var body: some View {
        Text("Frame")
            .infinityFrame()
            .foregroundStyle(.white)
            .background(.black)
    }
}

#Preview {
    Preview()
}
