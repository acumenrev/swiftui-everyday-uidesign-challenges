//
//  ViewWithBackground.swift
//  landing_page
//
//  Created by trivo on 17/02/2024.
//

import Foundation
import SwiftUI

struct ViewWithBackground: View {
    var mainContent: AnyView?

    var body: some View {
        ZStack {
            Image("mint_background")
            if let mainContent {
                AnyView(mainContent)
            }
        }
    }
}

#Preview {
    ViewWithBackground()
}
