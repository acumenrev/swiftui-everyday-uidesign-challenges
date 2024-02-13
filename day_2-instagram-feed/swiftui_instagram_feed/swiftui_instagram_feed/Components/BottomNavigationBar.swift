//
//  BottomNavigationBar.swift
//  swiftui_instagram_feed
//
//  Created by trivo on 13/02/2024.
//

import Foundation
import SwiftUI

enum BottomItems {
    case home
    case search
    case add
    case video
    case profile
}

public struct BottomNavigationBar: View {
    @State private var currentSelectedItem: BottomItems = .home


    public var body: some View {
        HStack {

            // house : house.fill
            Button {
                self.currentSelectedItem = .home
            } label: {
                Image(systemName: currentSelectedItem == .home ? "house.fill" : "house").font(.system(size: 24))
            }
            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
            Spacer()

            // magnifyingglass.circle: magnifyingglass.circle.fill
            Button {
                self.currentSelectedItem = .search
            } label: {
                Image(systemName: currentSelectedItem == .search ? "magnifyingglass.circle.fill" : "magnifyingglass.circle")
                    .font(.system(size: 24))
            }
            Spacer()
            // plus.app: plus.app.fill
            Button {
                self.currentSelectedItem = .add
            } label: {
                Image(systemName: currentSelectedItem == .add ? "plus.app.fill" : "plus.app")
                    .font(.system(size: 24))
            }
            Spacer()
            // play.square.stack: play.square.stack.fill
            Button {
                self.currentSelectedItem = .video
            } label: {
                Image(systemName: currentSelectedItem == .video ? "play.square.stack.fill" : "play.square.stack")
                    .font(.system(size: 24))
            }
            Spacer()
            // person.crop.circle: person.crop.circle.fill
            Button {
                self.currentSelectedItem = .profile
            } label: {
                Image(systemName: currentSelectedItem == .profile ? "person.crop.circle.fill" : "person.crop.circle")
                    .font(.system(size: 24))
            }
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20))

        }
    }
}

#Preview {
    BottomNavigationBar()
}
