//
//  MyNavigationBar.swift
//  app_settings
//
//  Created by trivo on 25/02/2024.
//

import Foundation
import SwiftUI

struct MyNavigationBar: View {
    var body: some View {
        NavigationView {
                    Text("SwiftUI")
                        .navigationTitle("Settings")
                        .toolbar {
                            ToolbarItemGroup(placement: .topBarTrailing) {
                                Button("About") {
                                    print("About tapped!")
                                }
                                Button("Help") {
                                    print("Help tapped!")
                                }
                            }
                            ToolbarItemGroup(placement: .secondaryAction) {
                                Button("Settings") {
                                    print("Settings tapped")
                                }
                                Button("Email Me") {
                                    print("Email tapped")
                                }
                            }
                        }
                }
    }
}

#Preview {
    MyNavigationBar()
}
