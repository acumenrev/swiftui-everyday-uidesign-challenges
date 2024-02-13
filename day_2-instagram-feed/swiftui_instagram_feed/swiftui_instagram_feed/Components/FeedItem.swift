//
//  FeedItem.swift
//  swiftui_instagram_feed
//
//  Created by trivo on 13/02/2024.
//

import Foundation
import SwiftUI



public struct FeedItem: View {
    let screenSize: CGSize
    init(screenSize: CGSize) {
        self.screenSize = screenSize
    }

    public var body: some View {
        VStack(alignment: .leading) {
            // feed user info
            FeedItemInfoView(userInfo: .init(username: "username", profileUrl: "https://i.pinimg.com/564x/1a/a9/ba/1aa9ba1e57508a13a22dfa75aadd5d2f.jpg", isFavorite: true))
            // thumbnail

            AsyncProfileImage(profileUrl: "https://cdn1.iconfinder.com/data/icons/flat-and-simple-part-1/128/microsoft-1024.png")
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: screenSize.width, height: 200)
            // feed reaction
            FeedReactionView()

            // likes number
            Text("999 likes").font(.system(size: 14)).bold()
                .padding(.init(top: 10, leading: 20, bottom: 0, trailing: 0))

            // caption
            FeedCommentView(screenSize: screenSize)

        }
        .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}


#Preview {
    FeedItem(screenSize: .init(width: 200, height: 200))
}
