//
//  ProfileImageView.swift
//  user_profile
//
//  Created by trivo on 24/02/2024.
//

import Foundation
import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        AsyncImage(url: URL.init(string: "https://randomuser.me/api/portraits/men/95.jpg")!)
            .clipShape(Circle())
    }
}

#Preview {
    ProfileImageView()
}
