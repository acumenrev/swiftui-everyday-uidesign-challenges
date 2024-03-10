//
//  CarouselItemComponent.swift
//  eshop
//
//  Created by trivo on 05/03/2024.
//

import Foundation
import SwiftUI

struct CarouselItemComponent: View {
    var body: some View {
        Button {

        } label: {
            AsyncImage(url: URL.init(string: "https://picsum.photos/500/500")) { image in
                image.resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 14))

            } placeholder: {
                ProgressView()
            }
        }

    }
}

#Preview {
    CarouselItemComponent()
}
