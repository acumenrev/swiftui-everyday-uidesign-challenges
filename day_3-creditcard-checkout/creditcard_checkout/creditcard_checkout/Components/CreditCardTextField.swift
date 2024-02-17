//
//  CardNumberTextField.swift
//  creditcard_checkout
//
//  Created by trivo on 14/02/2024.
//

import Foundation
import SwiftUI

struct CreditCardTextField: UIViewRepresentable {
    @Binding public var number: String
    var isEditingHandler: ((Bool) -> Void)?

    public init(number: Binding<String>, isEditingHandler: ((Bool) -> Void)?) {
        self._number = number
        self.isEditingHandler = isEditingHandler
    }

    public func makeUIView(context: Context) -> UITextField {
        let view = UITextField()
        view.addTarget(context.coordinator, action: #selector(Coordinator.reformatAsCardNumber), for: .editingChanged)
        view.delegate = context.coordinator
        return view
    }

    public func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = number // <-- Ở đây, bạn cần cập nhật mã để định dạng nó, nhưng tôi không biết cách tái cấu trúc mã
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator($number, isEditingHandler: self.isEditingHandler)
    }

    // MARK: Coordinator
    public class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var number: String
        private var previousTextFieldContent: String?
        private var previousSelection: UITextRange?
        var isEditingHandler: ((Bool) -> Void)?

        init(_ number: Binding<String>, isEditingHandler: ((Bool) -> Void)?) {
            self._number = number
            self.isEditingHandler = isEditingHandler
        }

        public func textFieldDidBeginEditing(_ textField: UITextField) {
            self.isEditingHandler?(true)
        }

        public func textFieldDidEndEditing(_ textField: UITextField) {
            self.isEditingHandler?(false)
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            previousTextFieldContent = textField.text
            previousSelection = textField.selectedTextRange
            return true
        }

        @objc func reformatAsCardNumber(textField: UITextField, for event: UIControl.Event) {
            var targetCursorPosition = 0
            if let startPosition = textField.selectedTextRange?.start {
                targetCursorPosition = textField.offset(from: textField.beginningOfDocument, to: startPosition)
            }

            var cardNumberWithoutSpaces = ""
            if let text = textField.text {
                cardNumberWithoutSpaces = self.removeNonDigits(string: text, andPreserveCursorPosition: &targetCursorPosition)
            }

            if cardNumberWithoutSpaces.count > 16 {
                textField.text = previousTextFieldContent
                textField.selectedTextRange = previousSelection
                return
            }

            let cardNumberWithSpaces = self.insertCreditCardSpaces(cardNumberWithoutSpaces, preserveCursorPosition: &targetCursorPosition)
            textField.text = cardNumberWithSpaces
            number = cardNumberWithSpaces

            if let targetPosition = textField.position(from: textField.beginningOfDocument, offset: targetCursorPosition) {
                textField.selectedTextRange = textField.textRange(from: targetPosition, to: targetPosition)
            }
        }

        func removeNonDigits(string: String, andPreserveCursorPosition cursorPosition: inout Int) -> String {
            var digitsOnlyString = ""
            let originalCursorPosition = cursorPosition
            for i in stride(from: 0, to: string.count, by: 1) {
                let characterToAdd = string[string.index(string.startIndex, offsetBy: i)]
                if characterToAdd >= "0" && characterToAdd <= "9" {
                    digitsOnlyString.append(characterToAdd)
                } else if i < originalCursorPosition {
                    cursorPosition -= 1
                }
            }
            return digitsOnlyString
        }

        func insertCreditCardSpaces(_ string: String, preserveCursorPosition cursorPosition: inout Int) -> String {
            var stringWithAddedSpaces = ""
            let cursorPositionInSpacelessString = cursorPosition
            for i in 0..<string.count {
                if i > 0 && (i % 4) == 0 {
                    stringWithAddedSpaces.append(" ")
                    if i < cursorPositionInSpacelessString {
                        cursorPosition += 1
                    }
                }
                let characterToAdd = string[string.index(string.startIndex, offsetBy: i)]
                stringWithAddedSpaces.append(characterToAdd)
            }
            return stringWithAddedSpaces
        }
    }
}

