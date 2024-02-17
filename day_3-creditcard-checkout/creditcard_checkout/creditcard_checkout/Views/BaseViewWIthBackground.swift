//
//  BaseViewWIthBackground.swift
//  creditcard_checkout
//
//  Created by trivo on 17/02/2024.
//

import Foundation
import SwiftUI

struct BaseViewWIthBackground: View {
    let title: String
    var middleContent: AnyView?
    var bottomButton: AnyView?


    var body: some View {
        ZStack {
            background.layoutPriority(0)
            mainContent.layoutPriority(1)
        }
    }

    private var background: some View {
        Image("background")
    }

    private var mainContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            // title
            Text(title)
                .multilineTextAlignment(.center)
                .font(.system(size: 32))
                .foregroundStyle(.white)
                .bold()
                .frame(maxWidth: .infinity)
                .padding(.init(top: 24, leading: 0, bottom: 24, trailing: 0))
            // content
            if let middleContent {
                AnyView(middleContent)
                    .padding(.init(top: 0, leading: 0, bottom: 24, trailing: 0))
            }


            // button
            if let bottomButton {
                AnyView(bottomButton)
                    .padding(.init(top: 0, leading: 0, bottom: 24, trailing: 0))
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    BaseViewWIthBackground(title: "Add new card", middleContent: AnyView(Text("Hello")), bottomButton: AnyView(ProceedButton(buttonTitle: "Proceed", backgroundColor: Color.orange, titleColor: Color.white)))

}
