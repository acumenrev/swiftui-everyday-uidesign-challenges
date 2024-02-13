//
//  ContentView.swift
//  swiftui_instagram_feed
//
//  Created by trivo on 13/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader(content: { geometry in
            VStack(alignment: .leading, spacing: 0) {
                TopNavigationBar()
                    .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                StoryView()
                    .frame(maxWidth: .infinity, maxHeight: 80)
                ScrollView(.vertical) {
                    FeedItem(screenSize: .init(width: geometry.size.width, height: geometry.size.height))
                    FeedItem(screenSize: .init(width: geometry.size.width, height: geometry.size.height))
                    FeedItem(screenSize: .init(width: geometry.size.width, height: geometry.size.height))
                    FeedItem(screenSize: .init(width: geometry.size.width, height: geometry.size.height))
                    
                }
                BottomNavigationBar()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        })
    }
}

#Preview {
    ContentView()
}
