//
//  SignUpScreen.swift
//  swiftui_signup
//
//  Created by trivo on 12/02/2024.
//

import Foundation
import SwiftUI

struct HTMLTextView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.dataDetectorTypes = .link
        textView.delegate = context.coordinator
        textView.isScrollEnabled = false
        textView.font = .monospacedSystemFont(ofSize: 12, weight: .black)
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if let attributedString = htmlContent.attributedHTMLString {
            uiView.attributedText = attributedString
        } else {
            uiView.text = htmlContent
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, UITextViewDelegate {
        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            // Handle the tap on the link
            print("Tapped URL: \(URL.absoluteString)")

            // Return false to allow the default behavior (open the link in Safari)
            return false
        }
    }
}

extension String {
    var attributedHTMLString: NSAttributedString? {
        guard let data = self.data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            print("Error parsing HTML: \(error)")
            return nil
        }
    }
}


struct SignUpScreen: View {
    @State var doAcceptPolicy: Bool = false
    private let policyString = "<p>By signing up you accept the <a href=\"http://www.google.com\">Terms of Service</a> and <a href=\"https://bing.com\">Privacy Policy</a></p>"

    var openSignInHandler: (() -> Void)?
    init(doAcceptPolicy: Bool, openSignInHandler: ( () -> Void)? = nil) {
        self.doAcceptPolicy = doAcceptPolicy
        self.openSignInHandler = openSignInHandler
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Sign Up").font(.title).bold()
                .padding(.init(top: 10, leading: 10, bottom: 40, trailing: 0))
            inputFields
                .padding(.init(top: 0, leading: 10, bottom: 10, trailing: 10))
            policyView
                .padding(.init(top: 0, leading: 20, bottom: 20, trailing: 20))
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            signUpButton
            Spacer()
            haveAnAccount

        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .border(Color.clear) // Optional: Add a border for visualization
        .padding()
    }

    private var inputFields: some View {
        return VStack {
            // username
            MyTextField(placeholder: "Username").padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
            // email
            MyTextField(placeholder: "Email").padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
            // pwd
            PasswordTextField(placeholder: "Enter Password").padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
            // confirm password
            PasswordTextField(placeholder: "Re-enter Password").padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
        }
    }

    private var policyView: some View {
        return HStack {
            Toggle(isOn: $doAcceptPolicy) {
                HTMLTextView(htmlContent: policyString).padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20))
            }
            .toggleStyle(CheckboxToggleStyle())
        }
    }

    private var signUpButton: some View {
        return HStack {
            Button(action: {
                print("Sign Up Clicked")
            }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(14)
            }.padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }

    private var haveAnAccount: some View {
        return HStack {
            Spacer()
            Text("Already have an account?")
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            Button {
                self.openSignInHandler?()
            } label: {
                Text("Sign In")
                    .font(.system(size: 14))
                    .foregroundStyle(.blue)
                    .bold()
            }


            Spacer()
        }
    }
}

#Preview {
    SignUpScreen(doAcceptPolicy: false)
}
