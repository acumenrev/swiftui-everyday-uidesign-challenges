//
//  PasswordTextField.swift
//  swiftui_signup
//
//  Created by trivo on 12/02/2024.
//

import Foundation
import SwiftUI

struct PasswordTextField: View {
    @State private var password: String = ""
    @State private var isPasswordVisible = false
    private let placeholder: String

    init(placeholder: String, password: String = "", isPasswordVisible: Bool = false) {
        self.password = password
        self.isPasswordVisible = isPasswordVisible
        self.placeholder = placeholder
    }

    var body: some View {
        HStack {
            if isPasswordVisible {
                TextField(placeholder, text: $password)
            } else {
                SecureField(placeholder, text: $password)
            }
            Button(action: {
                isPasswordVisible.toggle()
            }) {
                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 10)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12.0)
                .stroke(Color.gray, lineWidth: 1.0)
        )
    }
}


#Preview {
    PasswordTextField(placeholder: "Enter Password")
}
