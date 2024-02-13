//
//  FeedItemInfo.swift
//  swiftui_instagram_feed
//
//  Created by trivo on 13/02/2024.
//

import Foundation
import SwiftUI

struct FeedItemUserInfo {
    let username: String
    let profileUrl: String
    let isFavorite: Bool
}

struct FeedItemModel {
    let userInfo: FeedItemUserInfo
    let imgUrl: String
    let isLiked: Bool
    let likesNumber: Int
}

public struct FeedItemInfoView: View {
    let userInfo: FeedItemUserInfo

    init(userInfo: FeedItemUserInfo) {
        self.userInfo = userInfo
    }

    public var body: some View {
        HStack {
            ProfileView(profileUrl: userInfo.profileUrl, profileSize: .init(width: 50, height: 50))
                .frame(width: 80)
            // text
            Text(userInfo.username).font(.system(size: 14)).monospaced()
                .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 10))
                .frame(maxWidth: .infinity, alignment: .leading).lineLimit(1)
                .layoutPriority(1)
            // Favorite
            if userInfo.isFavorite {
                Image(systemName: "star.circle.fill").font(.system(size: 28)).foregroundStyle(.green)
            }
            // Option
            Button(action: {

            }, label: {
                Image(systemName: "ellipsis")
                    .font(.system(size: 20))
                    .foregroundStyle(.black)
            }).padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    FeedItemInfoView(userInfo: .init(username: "Username here", profileUrl: "https://cdn1.iconfinder.com/data/icons/flat-and-simple-part-1/128/microsoft-1024.png", isFavorite: false))
}
