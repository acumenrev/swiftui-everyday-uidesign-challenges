//
//  ImageButton.swift
//  swiftui_signup
//
//  Created by trivo on 12/02/2024.
//

import Foundation
import SwiftUI

struct ImageButton: View {
    private var buttonPressed: (() -> Void)?

    private let imgName: String
    init(imgName: String, buttonPressed: (() -> Void)? = nil) {
        self.imgName = imgName
        self.buttonPressed = buttonPressed
    }

    var body: some View {
        return Button(action: {
            // Action to perform when the button is tapped
            buttonPressed?()
        }) {
            Image(imgName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding()
                .background(Color.clear)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ImageButton(imgName: "apple") {
        print("pressed apple")
    }
}
