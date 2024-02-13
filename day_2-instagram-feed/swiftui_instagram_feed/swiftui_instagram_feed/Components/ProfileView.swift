//
//  ProfileView.swift
//  swiftui_instagram_feed
//
//  Created by trivo on 13/02/2024.
//

import Foundation
import SwiftUI

public struct AsyncProfileImage: View {

    let profileUrl: String
    init(profileUrl: String) {
        self.profileUrl = profileUrl
    }

    public var body: some View {
        AsyncImage(
            url: URL(string: profileUrl)!,
            transaction: Transaction(
                animation: .spring(response: 0.5, dampingFraction: 0.65, blendDuration: 0.025)
            )
        ) { phase in
            switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .transition(.scale)
                case .failure(_):
                    Image(systemName: "ant.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 128)
                        .foregroundColor(.teal)
                        .opacity(0.6)
                case .empty:
                    Image(systemName: "photo.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 128)
                        .foregroundColor(.teal)
                        .opacity(0.6)
                @unknown default:
                    ProgressView()
            }
        }
    }
}

public struct ProfileView: View {
    let profileUrl: String
    let profileSize: CGSize
    init(profileUrl: String, profileSize: CGSize) {
        self.profileUrl = profileUrl
        self.profileSize = profileSize
    }
    public var body: some View {
        HStack {
            Spacer()
            AsyncProfileImage(profileUrl: profileUrl)
                .padding()
                .frame(width: profileSize.width, height: profileSize.height)
                .aspectRatio(contentMode: .fill)
                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
            Spacer()
        }
    }
}

#Preview {
    ProfileView(profileUrl: "https://i.pinimg.com/564x/1a/a9/ba/1aa9ba1e57508a13a22dfa75aadd5d2f.jpg", profileSize: .init(width: 150, height: 150))
}
