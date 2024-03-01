//
//  MusicPlayerBar.swift
//  music-player
//
//  Created by trivo on 29/02/2024.
//

import Foundation
import SwiftUI

struct MusicPlayerBar: View {
    @State private var isPlayed: Bool = false
    var expandHandler: (() -> Void)?

    var body: some View {

        HStack {
            Button(action: {
                expandHandler?()
            }, label: {
                // album
                Image("sample_album_cover", bundle: nil)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                // song title
                Text("You belong with me")
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.black)
                Spacer()
            }).layoutPriority(1)
                .padding()

            // play button
            Button(action: {
                isPlayed.toggle()
            }, label: {
                Image(systemName: isPlayed ? "pause.fill" : "play.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.black)
            })
            .padding()
            // forward button
            Button(action: {}, label: {
                Image(systemName: "forward.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 25)
                    .foregroundStyle(.black)
            })
            .padding()
        }
        .background(Color.customTeal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .gray, radius: 5, x: 0, y: 2)
        .padding()
    }
}

struct CustomColorStyle: ShapeStyle {
    let red: Double
    let green: Double
    let blue: Double

    func _opaqueRepresentation(within srgb: Color.RGBColorSpace) -> Color {
        return Color.init(red: red, green: green, blue: blue)
    }
}

extension Color {
    static var customTeal: Color {
        return .init(red: 250, green: 247, blue: 245)
    }

    init(red: Int, green: Int, blue: Int) {
        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: 1
        )
    }
}

#Preview {
    MusicPlayerBar()
}
