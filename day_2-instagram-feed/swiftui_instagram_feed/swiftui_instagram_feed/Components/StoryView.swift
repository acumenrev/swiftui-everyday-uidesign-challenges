//
//  StoryView.swift
//  swiftui_instagram_feed
//
//  Created by trivo on 13/02/2024.
//

import Foundation
import SwiftUI

public struct StoryView: View {
    let profileSize: CGSize = .init(width: 60, height: 60)

    public var body: some View {
        HStack {
            // add button
            Button(action: {

            }, label: {
                Image(systemName: "plus").font(.system(size: 28))
                    .padding()
            })
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.blue, lineWidth: 3)
            )
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20))

            // vertical separtor
            Divider()
                .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))

            // horizontal list view
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ProfileView(profileUrl: "https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.png", profileSize: profileSize)
                    ProfileView(profileUrl: "https://i.pinimg.com/564x/1a/a9/ba/1aa9ba1e57508a13a22dfa75aadd5d2f.jpg", profileSize: profileSize)
                    ProfileView(profileUrl: "https://cdn1.iconfinder.com/data/icons/flat-and-simple-part-1/128/microsoft-1024.png", profileSize: profileSize)
                    ProfileView(profileUrl: "https://cdn1.iconfinder.com/data/icons/flat-and-simple-part-1/128/microsoft-1024.png", profileSize: profileSize)
                    ProfileView(profileUrl: "https://cdn1.iconfinder.com/data/icons/flat-and-simple-part-1/128/microsoft-1024.png", profileSize: profileSize)
                    ProfileView(profileUrl: "https://cdn1.iconfinder.com/data/icons/flat-and-simple-part-1/128/microsoft-1024.png", profileSize: profileSize)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    StoryView()
}
