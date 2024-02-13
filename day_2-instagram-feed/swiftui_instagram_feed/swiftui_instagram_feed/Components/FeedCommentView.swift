//
//  FeedCommentView.swift
//  swiftui_instagram_feed
//
//  Created by trivo on 13/02/2024.
//

import Foundation
import SwiftUI

public struct FeedCommentView: View {
    let screenSize: CGSize
    init(screenSize: CGSize) {
        self.screenSize = screenSize
    }

    public var body: some View {
        HStack(alignment: .top) {
            // account user name
            Button(action: {
                print("account tapped")
            }, label: {
                Text("mincoconut").font(.system(size: 14)).bold().foregroundStyle(.black)
            })
            .padding(.init(top: 0, leading: 24, bottom: 0, trailing: 0))
            // caption
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam").lineLimit(2)
                .font(.system(size: 14))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 24))
        }
        .frame(width: screenSize.width, alignment: .topLeading)
    }
}

#Preview {
    FeedCommentView(screenSize: .init(width: 300, height: 300))
}
