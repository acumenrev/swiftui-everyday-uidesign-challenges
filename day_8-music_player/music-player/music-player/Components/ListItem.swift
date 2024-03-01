//
//  ListItem.swift
//  music-player
//
//  Created by trivo on 25/02/2024.
//

import Foundation
import SwiftUI

struct ListItem: View {
    let iconName: String
    let title: String
    var tapHandler: (() -> Void)?

    var body: some View {
        Button {
            tapHandler?()
        } label: {
            HStack(alignment: .center) {
                // Icon
                Image(systemName: iconName).fixedSize()
                    .foregroundStyle(.red)
                    .frame(width: 40, height: 40)
                    .offset(y: -8)
                // Title
                VStack(alignment: .leading) {
                    HStack {
                        Text(title).foregroundStyle(.black)
                        Spacer()
                        // arrow
                        Image(systemName: "chevron.right").foregroundStyle(.gray)
                    }.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 12))
                    Divider().frame(height: 2)
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}


#Preview {
    ListItem(iconName: "externaldrive.badge.wifi", title: "hello")
}
