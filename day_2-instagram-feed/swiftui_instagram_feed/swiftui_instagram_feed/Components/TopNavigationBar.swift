//
//  TopNavigationBar.swift
//  swiftui_instagram_feed
//
//  Created by trivo on 13/02/2024.
//

import Foundation
import SwiftUI

public struct TopNavigationBar: View {
    public var body: some View {
        HStack {
            // logo
            Image("instagram", bundle: nil)
                .resizable()
                .frame(width: 50, height: 50)
            // app name
            Text("Instagram")
                .font(Font.custom("FlamousePersonalUseOnly-Reg", size: 28))

            // spacer
            Spacer()

            // heart icon
            Button(action: {

            }, label: {
                Image(systemName: "heart").font(.system(size: 24)).bold()
                    .foregroundStyle(.black)
            })
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 10))

            // messaging
            Button(action: {

            }, label: {
                Image(systemName: "message").font(.system(size: 24)).bold()
                    .foregroundStyle(.black)
            })
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
        }
    }
}

#Preview {
    TopNavigationBar()
}
