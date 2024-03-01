//
//  SongListView.swift
//  music-player
//
//  Created by trivo on 25/02/2024.
//

import Foundation
import SwiftUI

struct SongListView: View {
    @State private var isPopoverPresented = false
    
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView(content: {
            mainContent
                .navigationTitle("Library")
                .sheet(isPresented: $isPopoverPresented, content: {
                    MusicPlayerView()
                })
        })
    }

    private var mainContent: some View {
        ZStack {
            VStack {
                ScrollView {
                    // playlist options
                    playlistsContent
                    // album content
                    albumsContent
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

            VStack(alignment: .leading) {
                MusicPlayerBar(expandHandler: {
                    isPopoverPresented.toggle()
                })
                    .offset(y: -30)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
    }

    private var playlistsContent: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink {
                    Text("Person View")
                } label: {
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }

            }.offset(y: -20)
            ListItem(iconName: "airpod.right", title: "Playlists")
            ListItem(iconName: "microwave", title: "Artists")
            ListItem(iconName: "paperplane", title: "Albums")
            ListItem(iconName: "ipodshuffle.gen2", title: "Made for You")
            ListItem(iconName: "ellipsis.curlybraces", title: "Songs")
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .padding()
    }

    private var albumsContent: some View {
        LazyVGrid(columns: gridItems, spacing: 16) {
            ForEach(0..<9) { index in
                AlbumItem(imageUrl: "https://assets-prd.ignimgs.com/2021/10/14/demonslayer-art-1634244394273.png", title: "Demon Slayer", artist: "Anime")
            }
        }
        .padding()
    }
}

struct FadeInOutTransition: ViewModifier {
    var isPresenting: Bool

    func body(content: Content) -> some View {
        content
            .opacity(isPresenting ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 0.5))
    }
}

extension AnyTransition {
    static var fadeInOut: AnyTransition {
        .modifier(
            active: FadeInOutTransition(isPresenting: true),
            identity: FadeInOutTransition(isPresenting: false)
        )
    }
}

#Preview {
    SongListView()
}

