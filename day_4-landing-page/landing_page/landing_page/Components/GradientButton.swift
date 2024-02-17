//
//  GradientButton.swift
//  landing_page
//
//  Created by trivo on 17/02/2024.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    let gradientColors: [Color]

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(
                LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottom)
            )
            .cornerRadius(10)
            .shadow(color: .gray, radius: 4, x: 0, y: 2)
    }
}

struct GradientButton: View {
    var tapHandler: (() -> Void)?

    var body: some View {
        VStack {
            Button(action: {
                // Handle button tap
                print("Gradient button tapped!")
                tapHandler?()
            }) {
                Text("Tap me")
                    .font(.headline)
            }
            .buttonStyle(GradientButtonStyle(gradientColors: [.red.opacity(0.4), .red]))
        }
        .padding()
    }
}

#Preview {
    GradientButton()
}
