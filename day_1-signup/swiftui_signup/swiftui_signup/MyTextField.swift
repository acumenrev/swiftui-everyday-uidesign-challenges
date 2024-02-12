//
//  MyTextField.swift
//  swiftui_signup
//
//  Created by trivo on 12/02/2024.
//

import Foundation
import SwiftUI

struct MyTextField: View {
    @State private var text = ""

    var placeholder: String
    let validIconName = "checkmark"
    let validColor = Color.green
    let invalidIconName = "xmark"
    let invalidColor = Color.red
    var isValid: Bool = true

    init(placeholder: String,text: String = "") {
        self.text = text
        self.placeholder = placeholder
    }

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding()
            validationImage()
                .foregroundColor(isValid ? validColor : invalidColor)
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20.0))
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12.0)
                .stroke(Color.gray, lineWidth: 1.0)
        )
    }

    private func validationImage() -> Image {
        let imgName = isValid ? validIconName : invalidIconName
        return Image(systemName: imgName)
    }
}


#Preview {
    MyTextField(placeholder: "Sample")
}

