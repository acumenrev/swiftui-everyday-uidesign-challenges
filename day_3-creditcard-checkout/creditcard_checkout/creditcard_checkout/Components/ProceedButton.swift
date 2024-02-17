//
//  ProceedButton.swift
//  creditcard_checkout
//
//  Created by trivo on 14/02/2024.
//

import Foundation
import SwiftUI

struct ProceedButton: View {
    let buttonTitle: String
    let backgroundColor: Color
    let titleColor: Color
    var tappedHandler: (() -> Void)?
    init(buttonTitle: String, backgroundColor: Color, titleColor: Color,tappedHandler: ( () -> Void)? = nil) {
        self.buttonTitle = buttonTitle
        self.backgroundColor = backgroundColor
        self.tappedHandler = tappedHandler
        self.titleColor = titleColor
    }

    var body: some View {
        Button(action: {
            tappedHandler?()
        }, label: {
            Text(buttonTitle)
                .bold()
                .font(.system(size: 22))
                .padding(.init(top: 14, leading: 34, bottom: 14, trailing: 34))
                .background(Capsule().fill(backgroundColor))
                .foregroundStyle(titleColor)
        })
    }
}

#Preview {
    ProceedButton(buttonTitle: "Procceed", backgroundColor: Color.orange, titleColor: Color.white)
}
