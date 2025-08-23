//
//  IntroBoxView.swift
//  IncomeUltra
//
//  Created by Dylan on 23/8/25.
//

import SwiftUI

struct IntroBoxView: View {
    let data: Data
    var body: some View {
        BoxView(
            title: data.title,
            sfSymbol: data.sfSymbol
        ) {
            HStack(alignment: .top) {
                imageView
                descriptionView
            }
        }
    }
}

private extension IntroBoxView {
    var imageView: some View {
        Image(data.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 80.0, height: 80.0)
            .cornerRadius(.image)
    }
    var descriptionView: some View {
        Text(data.description)
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .foregroundStyle(Color.appColorTheme.text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 4.0)
    }
}

extension IntroBoxView {
    struct Data {
        let title: String
        let sfSymbol: String?
        let imageName: String
        let description: String
    }
}

#Preview {
    IntroBoxView(
        data: IntroBoxView.Data(
            title: "Income Ultra",
            sfSymbol: "info.circle",
            imageName: "AppIconImage",
            description: "This app is amazing."
        )
    )
    .padding()
    .infinityFrame()
    .background(Color.appColorTheme.viewBackground)
}
