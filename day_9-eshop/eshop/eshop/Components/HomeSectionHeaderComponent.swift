//
//  HomeSectionHeaderComponent.swift
//  eshop
//
//  Created by trivo on 10/03/2024.
//

import Foundation
import SwiftUI

struct HomeSectionHeaderComponent: View {
    let sectionTitle: String
    var viewAllHandler: (() -> Void)?
    var body: some View {
        HStack {
            Text(sectionTitle).bold().font(.system(size: 20))
            Spacer()
            Button(action: {
                viewAllHandler?()
            }, label: {
                Text("View All").font(.system(size: 16))
            })
        }
        .padding()
    }
}

#Preview {
    HomeSectionHeaderComponent(sectionTitle: "Hello")
}
