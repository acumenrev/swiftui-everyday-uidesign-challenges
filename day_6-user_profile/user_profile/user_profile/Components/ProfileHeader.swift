//
//  ProfileHeader.swift
//  user_profile
//
//  Created by trivo on 24/02/2024.
//

import Foundation
import SwiftUI

struct ProfileHeader: View {
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                // background
                VStack(alignment: .leading) {
                    // background image
                    Image("background", bundle: nil)
                        .resizable()
                        .frame(height: geometry.size.height*2/3)
                    // white background
                    Color.white
                }.frame(maxWidth: .infinity, alignment: .topLeading)

                // image background

                VStack {
                    ProfileImageView()
                    Text("Jason Luu").font(.system(size: 20)).bold()
                    Text("Designer").font(.system(size: 16))
                }
                .offset(y: geometry.size.height / 5)
            }
        })
    }
}

#Preview {
    ProfileHeader()
}
