//
//  UserProfileView.swift
//  user_profile
//
//  Created by trivo on 24/02/2024.
//

import Foundation
import SwiftUI

struct UserProfileView: View {
    var body: some View {
        mainContent
    }

    private var mainContent: some View {
        GeometryReader(content: { geometry in
            VStack {
                ScrollView {
                    // background
                    ProfileHeader()
                        .frame(height: geometry.size.height*2/5)
                    // name
                    TextFieldWithTitle(userInput: "jasonLuu99", title: "Name", placeholder: "Name", isSecure: false).padding()

                    // email
                    TextFieldWithTitle(userInput: "jasonLuu99@abc.com", title: "Email", placeholder: "Email", isSecure: false).padding()

                    // password
                    TextFieldWithTitle(userInput: "jasonLuu99", title: "Password", placeholder: "Password", isSecure: true).padding()

                    // user id
                    TextFieldWithTitle(userInput: "ABC1234", title: "User ID", placeholder: "User Id", isSecure: false).padding()

                    // zip code
                    TextFieldWithTitle(userInput: "95126", title: "Zip Code", placeholder: "Zip Code", isSecure: false).padding()
                }
            }
        })

    }
}

#Preview {
    UserProfileView()
}
