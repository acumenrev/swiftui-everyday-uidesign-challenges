//
//  SongItem.swift
//  music-player
//
//  Created by trivo on 25/02/2024.
//

import Foundation
import SwiftUI

struct AlbumItem: View {
    let imageUrl: String
    let title: String
    let artist: String
    var tapHandler: (() -> Void)?

    var body: some View {
        Button {
            tapHandler?()
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                // thumbnail
                AsyncImage(
                    url: URL.init(string: imageUrl),
                    content: { image in
                        image.resizable()
                            .aspectRatio(1.0, contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                // Album Name
                Text(title).font(.system(size: 18))
                    .foregroundStyle(.black)

                // Artist
                Text(artist).font(.system(size: 14)).foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    AlbumItem(imageUrl: "https://assets-prd.ignimgs.com/2021/10/14/demonslayer-art-1634244394273.png", title: "Demon Slayer", artist: "Anime")
}
