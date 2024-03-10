//
//  ItemComponent.swift
//  eshop
//
//  Created by trivo on 03/03/2024.
//

import Foundation
import SwiftUI

struct ItemComponent: View {
    var body: some View {
        mainContent
    }

    private var mainContent: some View {
        ZStack {
            // background

            infoContent.layoutPriority(3)
            // item info
        }.clipShape(RoundedRectangle(cornerRadius: 10))
    }

    private var backgroundContent: some View {
        VStack {
            AsyncImage(url: URL.init(string: "https://picsum.photos/500/500")) { img in
                img.resizable().aspectRatio(contentMode: .fill).clipShape(RoundedRectangle(cornerRadius: 10)).padding()
            } placeholder: {
                ProgressView()
            }
        }
    }

    private var infoContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Name
            Text("Fruit").bold().foregroundStyle(.black).font(.system(size: 24)).padding(.init(top: 10, leading: 14, bottom: 10, trailing: 14))
            // Price
            Text("$3.30").foregroundStyle(.black).font(.system(size: 18)).padding(.init(top: 0, leading: 14, bottom: 0, trailing: 14))
            backgroundContent
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.orange.opacity(0.3))
    }
}

#Preview {
    ItemComponent().frame(width: 200, height: 200)
}
