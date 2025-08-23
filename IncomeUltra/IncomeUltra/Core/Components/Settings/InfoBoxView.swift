//
//  InfoBoxView.swift
//  IncomeUltra
//
//  Created by Dylan on 23/8/25.
//

import SwiftUI

struct InfoBoxView: View {
    let data: Data
    var body: some View {
        BoxView(
            title: data.title,
            sfSymbol: data.sfSymbol
        ) {
            VStack(spacing: 8.0) {
                ForEach(data.infoItems, id: \.title) { info in
                    let isLastItem = info.title == data.infoItems.last?.title
                    infoRowView(info: info)
                    if !isLastItem {
                        dividerView
                    }
                }
            }
        }
    }
}

private extension InfoBoxView {
    func infoRowView(info: Data.Info) -> some View {
        HStack {
            Text(info.title)
            Spacer()
            if let desc = info.description {
                Text(desc)
                    .foregroundStyle(Color.appColorTheme.secondaryText)
            } else if let urlString = info.urlString, let url = URL(string: urlString) {
                Link(destination: url) {
                    linkLabelView
                }
            }
        }
    }
    var dividerView: some View {
        Divider()
            .foregroundStyle(Color.appColorTheme.divider)
    }
    var linkLabelView: some View {
        HStack(spacing: 4.0) {
            Image(systemName: "link")
            Text("Link")
                .fontWeight(.medium)
                .underline()
        }
        .foregroundStyle(Color.appColorTheme.secondaryText)
    }
}

extension InfoBoxView {
    struct Data {
        let title: String
        let sfSymbol: String?
        let infoItems: [Info]
    }
}

extension InfoBoxView.Data {
    struct Info {
        let title: String
        var description: String?
        var urlString: String?
    }
}

#Preview {
    InfoBoxView(
        data: .init(
            title: "Application",
            sfSymbol: "iphone",
            infoItems: [
                .init(title: "Developer", description: "Pyae Sone Han"),
                .init(title: "Version", description: "1.0"),
                .init(title: "Website", urlString: "https://www.example.com")
            ]
        )
    )
    .padding()
    .infinityFrame()
    .background(Color.appColorTheme.viewBackground)
        
}
