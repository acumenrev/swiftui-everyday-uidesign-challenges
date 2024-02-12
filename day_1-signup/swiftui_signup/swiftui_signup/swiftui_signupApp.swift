//
//  swiftui_signupApp.swift
//  swiftui_signup
//
//  Created by trivo on 12/02/2024.
//

import SwiftUI


enum Screen {
    case login
    case signUp
}

@main
struct swiftui_signupApp: App {
    @State var currentScreen: Screen = .login

    var body: some Scene {
        WindowGroup {
            switch currentScreen {
            case .login:
                SignInScreen(isChecked: false) {
                    self.currentScreen = .signUp
                }
            case .signUp:
                SignUpScreen(doAcceptPolicy: false) {
                    self.currentScreen = .login
                }
            }
        }
    }
}
