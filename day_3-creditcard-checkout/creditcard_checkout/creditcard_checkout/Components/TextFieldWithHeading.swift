//
//  TextFieldWithHeading.swift
//  creditcard_checkout
//
//  Created by trivo on 17/02/2024.
//

import Foundation
import SwiftUI

enum TextFieldType {
    case normal
    case creditCardNumber
    case numberOnly
}

struct TextFieldWithHeading: View {
    let header: String
    let textFieldPlaceHolder: String
    var trailingButtonImage: Image?
    var trailingButtonHandler: (() -> Void)?
    let textFieldType: TextFieldType
    @State var textFieldInput: String = ""
    @State private var isFocused: Bool = false

    init(header: String, textFieldType: TextFieldType, textFieldPlaceHolder: String = "", trailingButtonImage: Image? = nil, trailingButtonHandler: (() -> Void)? = nil) {
        self.header = header
        self.textFieldType = textFieldType
        self.trailingButtonImage = trailingButtonImage
        self.trailingButtonHandler = trailingButtonHandler
        self.textFieldPlaceHolder = textFieldPlaceHolder
    }

    var body: some View {
        VStack(alignment: .leading) {
            // header
            Text(header).font(.system(size: 16)).foregroundStyle(isFocused ? Color.black : .gray).bold(isFocused)
            // text field
            switch textFieldType {
            case .normal:
                normalTextField
            case .creditCardNumber:
                creditCardTextField
            case .numberOnly:
                numberOnlyTextField
            }
            Divider()
                .frame(height: 2)
                .overlay(isFocused ? Color.black : Color.black.opacity(0.2))
        }
    }


    private var normalTextField: some View {
        TextField("Enter text", text: $textFieldInput, onEditingChanged: { isEditing in
            isFocused = isEditing
            if isEditing {
                print("TextField focused")
            } else {
                print("TextField focus removed")
            }
        })

    }

    private var creditCardTextField: some View {

        HStack {
            CreditCardTextField(number: $textFieldInput) { isEditing in
                self.isFocused = isEditing
            }
            .frame(height: 30).layoutPriority(1)
            Spacer()
            if let trailingButtonImage {
                Button(action: {

                }, label: {
                    trailingButtonImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 40)

                })

            }
        }
    }

    private var numberOnlyTextField: some View {
        TextField(textFieldPlaceHolder, text: $textFieldInput, onEditingChanged: { isEditing in
            isFocused = isEditing
        })
    }
}

#Preview {
    TextFieldWithHeading(header: "Hello", textFieldType: .creditCardNumber, textFieldPlaceHolder: "Hello World!", trailingButtonImage: Image("visa"))
}
