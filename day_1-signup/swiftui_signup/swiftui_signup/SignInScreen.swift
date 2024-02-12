//
//  SignInScreen.swift
//  swiftui_signup
//
//  Created by trivo on 12/02/2024.
//

import Foundation
import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
            configuration.label
        }
    }
}

struct LineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct SignInScreen: View {
    @State var isChecked: Bool = false
    var openSignUpHandlerL: (() -> Void)?
    init(isChecked: Bool, openSignUpHandlerL: ( () -> Void)? = nil) {
        self.isChecked = isChecked
        self.openSignUpHandlerL = openSignUpHandlerL
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Sign In").font(.title).bold()
                .padding(.init(top: 10, leading: 10, bottom: 40, trailing: 0))
            inputFields
            forgotPasswordAndRememberMe.padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
            signInButton.padding(.init(top: 10, leading: 20, bottom: 0, trailing: 20))
            seperator
                .padding(.init(top: 20, leading: 20, bottom: 0, trailing: 20))
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            socialLogins
            Spacer()
            dontHaveAccount
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .border(Color.clear) // Optional: Add a border for visualization
        .padding()
    }

    private var inputFields : some View {
        return VStack {
            // email
            MyTextField(placeholder: "Email").padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
            // pwd
            PasswordTextField(placeholder: "Enter Password").padding(.init(top: 0, leading: 20, bottom: 10, trailing: 20))
        }
    }

    private var forgotPasswordAndRememberMe: some View {
        return HStack {
            Toggle(isOn: $isChecked) {
                Text("Remember me").font(.system(size: 12))
            }
            .toggleStyle(CheckboxToggleStyle())
            Spacer()
            Button(action: {
                // Action to perform when the label is clicked
                print("Forgot password clicked")
            }) {
                Text("Forgot password").font(.system(size: 14)).italic()
                    .background(Color.clear)
                    .foregroundColor(.gray)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
            }
        }
    }

    private var signInButton: some View {
        return HStack {
            Button(action: {
                print("Sign In Clicked")
            }) {
                Text("Sign In")
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }

    private var seperator: some View {
        return HStack {
            Spacer()
            LineShape()
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 80)
            Text("OR").italic().font(.system(size: 14)).foregroundStyle(Color.gray)
            LineShape()
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 80)
            Spacer()
        }
    }

    private var socialLogins: some View {
        return HStack(alignment: .center) {
            Spacer()
            ImageButton(imgName: "facebook") {
                print("facebook pressed")
            }
            ImageButton(imgName: "apple") {
                print("apple pressed")
            }
            ImageButton(imgName: "twitter") {
                print("twitter pressed")
            }
            Spacer()
        }
    }

    private var dontHaveAccount: some View {
        return HStack {
            Spacer()
            Text("Don't have an account?")
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            Button {
                self.openSignUpHandlerL?()
            } label: {
                Text("Create new one")
                    .font(.system(size: 14))
                    .bold()
            }


            Spacer()
        }
    }
}


#Preview {
    SignInScreen(isChecked: false)
}
