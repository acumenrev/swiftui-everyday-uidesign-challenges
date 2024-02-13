//
//  FeedReactionView.swift
//  swiftui_instagram_feed
//
//  Created by trivo on 13/02/2024.
//

import Foundation
import SwiftUI

public struct FeedReactionView: View {
    @State var isLiked: Bool = false

    public var body: some View {
        HStack {
            // like
            Button(action: {

            }, label: {
                Image(systemName: isLiked ? "heart.fill" : "heart").foregroundStyle(isLiked ? .red : .black)
                    .font(.system(size: 24))
                    .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 5))
            })

            // comment
            Button(action: {

            }, label: {
                Image(systemName: "message").foregroundStyle(.black).font(.system(size: 24))
                    .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 5))
            })

            // repost
            Button(action: {

            }, label: {
                Image(systemName: "square.and.arrow.up").foregroundStyle(.black).font(.system(size: 24))
                    .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 0))
            })
            Spacer()
            // bookmark
            Button(action: {

            }, label: {
                Image(systemName: "bookmark").foregroundStyle(.black).font(.system(size: 24))
                    .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 24))
            })
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    FeedReactionView()
}
