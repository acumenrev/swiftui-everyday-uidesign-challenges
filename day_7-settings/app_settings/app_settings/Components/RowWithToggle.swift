//
//  RowWithToggle.swift
//  app_settings
//
//  Created by trivo on 25/02/2024.
//

import Foundation
import SwiftUI

struct RowWithToggle: View {
    @State private var isToggled: Bool = false
    let title: String

    var body: some View {
        HStack {
            Text(title).layoutPriority(1)
            Spacer()
            Toggle(isOn: $isToggled, label: {

            })
        }

    }
}

#Preview {
    RowWithToggle(title: "Fullscreen Background")
}
