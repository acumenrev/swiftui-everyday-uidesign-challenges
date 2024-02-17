//
//  LandingPageStartView.swift
//  landing_page
//
//  Created by trivo on 17/02/2024.
//

import Foundation
import SwiftUI

struct LandingPageStartView: View {
    @State var isShowNextView: Bool = false
    var body: some View {
        NavigationStack {
            ViewWithBackground(mainContent: AnyView(mainContent))
                .navigationDestination(isPresented: $isShowNextView) {
                    LandingPageSecondView()
                }
                .navigationBarBackButtonHidden()
        }

    }

    private var mainContent: some View {
        VStack {
            // title
            Text("WELCOME").font(.system(size: 34)).monospaced()
            // description
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation")
                .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .font(.system(size: 16)).monospaced()
                .lineLimit(nil)
                .padding()

            
            // button next

            GradientButton {
                self.isShowNextView = true
                print("vo day khong")
            }

        }
        .frame(maxWidth: 400)
    }
}

#Preview {
    LandingPageStartView()
}
