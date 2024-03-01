//
//  MusicPlayerView.swift
//  music-player
//
//  Created by trivo on 25/02/2024.
//

import Foundation
import SwiftUI

struct MusicPlayerView: View {
    @State private var isPlayed: Bool = false
    @State private var progress = 0.8
    @State private var volume = 0.5

    var body: some View {
        mainContent
    }

    var mainContent: some View {
        ZStack {
            Image("sample_album_cover", bundle: nil)
                .aspectRatio(contentMode: .fill)
                .layoutPriority(1)
            songPanel.layoutPriority(2)
        }
    }

    var songPanel: some View {
        VStack(alignment: .leading, spacing: 40) {
            songPlayInfo
            playControls
            volumeControls
            otherButtons
        }
        .background(.black.opacity(0.5))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
    }

    var songPlayInfo: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                Text("Lorem ipsum dolor sit amet, coctetur adipiscing eli").font(.system(size: 20)).foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .bold()
                Spacer()
                Button(action: {

                }, label: {
                    Image(systemName: "ellipsis")
                        .frame(width: 40, height: 40)
                        .background()
                        .clipShape(Circle())

                })
            }
            .frame(maxWidth: .infinity)
            HStack {
                ProgressView(value: progress).progressViewStyle(.linear).tint(.white)
                    .gesture(DragGesture(minimumDistance: 10).onChanged({ newValue in
                        let newProgress = newValue.location.x / 300 // Assuming width of 200
                        progress = min(max(newProgress, 0), 1)
                    }))
            }
            HStack {
                // time played
                Text("5:30").font(.system(size: 14)).foregroundStyle(.white)
                Spacer()
                // sound tech
                Text("Dolby Atmos").font(.system(size: 14)).foregroundStyle(.white)
                Spacer()
                // remaining time
                Text("1:30").font(.system(size: 14)).foregroundStyle(.white)
            }
        }
        .padding(.init(top: 24, leading: 34, bottom: 0, trailing: 34))
        .frame(maxWidth: .infinity)
    }

    var playControls: some View {
        HStack {
            Spacer()
            // backward
            Button(action: {}, label: {
                Image(systemName: "backward.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
            })
            Spacer()
            // play
            Button(action: {
                isPlayed.toggle()
            }, label: {
                Image(systemName: !isPlayed ? "play.fill" : "pause.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
            })
            Spacer()
            // forward
            Button(action: {}, label: {
                Image(systemName: "forward.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
            })
            Spacer()
        }
    }

    var volumeControls: some View {
        HStack(alignment: .center, spacing: 20) {
            Spacer()
            Button(action: {
                volume = min(max(volume - 0.1, 0), 1)
            }, label: {
                Image(systemName: "speaker.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
            })

            ProgressView(value: volume).progressViewStyle(.linear).tint(.white)
                .gesture(DragGesture(minimumDistance: 10).onChanged({ newValue in
                    let newProgress = newValue.location.x / 300 // Assuming width of 200
                    volume = min(max(newProgress, 0), 1)
                }))
            Spacer()
            Button(action: {
                volume = min(max(volume + 0.1, 0), 1)
            }, label: {
                Image(systemName: "speaker.wave.2.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
            })

            Spacer()
        }.padding()
    }

    var otherButtons: some View {
        HStack(alignment: .center) {
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.white)
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "airplayaudio.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.white)
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "list.bullet.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.white)
            })
            Spacer()
        }
        .padding()
    }

}

#Preview {
    MusicPlayerView()
}
