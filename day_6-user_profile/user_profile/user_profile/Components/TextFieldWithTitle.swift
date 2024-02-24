//
//  TextFieldWithTitle.swift
//  user_profile
//
//  Created by trivo on 24/02/2024.
//

import Foundation
import SwiftUI

struct TextFieldWithTitle: View {
    @State private var userInput: String = ""
    @State private var isFocus: Bool = false
    let title: String
    let placeholder: String
    let isSecure: Bool

    init(userInput: String, title: String, placeholder: String, isSecure: Bool) {
        self.userInput = userInput
        self.title = title
        self.placeholder = placeholder
        self.isSecure = isSecure
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(title).bold()
            if isSecure {
                passwordInput
            } else {
                normalInput
            }
            Divider().frame(height: 2).background(isFocus ? .black : .gray.opacity(0.2))
        }.frame(maxWidth: .infinity, alignment: .topLeading)
    }

    private var normalInput: some View {
        TextField(placeholder, text: $userInput) { isEditing in
            isFocus = isEditing
        }
    }

    private var passwordInput: some View {
        let binding = Binding(
            get: {
                userInput
            },
            set: {
                userInput = $0
                print("new password: \($0)")
            })
        return SecureField(placeholder, text: binding)
    }
}

class SecureFieldModel: ObservableObject {
    @Published var secureText = "" {
        didSet {
            print(secureText)
        }
    }
}

#Preview {
    TextFieldWithTitle(userInput: "Hs", title: "Hello", placeholder: "xin chao", isSecure: false)
}
